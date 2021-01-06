using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;
using Models;
using Npgsql;

namespace Data
{
    internal record SqlParam(string Key, object Value);
    
    public static class Query
    {
        private static async Task<T> Extract<T>(NpgsqlConnection conn, string sql, IEnumerable<SqlParam>? parameters)
        {
            await using var cmd = new NpgsqlCommand(sql, conn);
            if (parameters != null)
                foreach (var (key, value) in parameters)
                {
                    cmd.Parameters.AddWithValue(key, value);
                }

            await using var reader = await cmd.ExecuteReaderAsync();
            await reader.ReadAsync();
            var rawJson = reader.GetString(0);
            var json = JsonSerializer.Deserialize<T>(rawJson);
            if (json == null)
            {
                throw new InvalidOperationException("Could not parse DB JSON data");
            }

            return json;
        }

        public static async Task<Composer> GetComposerBySlug(AppDb db, string slug)
        {
            const string sql = @"
select json_build_object(
       'Id', c.id,
       'LastName', c.last_name,
       'FirstName', c.first_name,
       'YearBorn', c.year_born,
       'YearDied', c.year_died,
       'Countries', json_agg(c2.name),
       'Slug', c.slug,
       'WikipediaLink', c.wikipedia_link,
       'ImslpLink', c.imslp_link) json
from composers as c
         join composers_countries cc on c.id = cc.composer_id
         join countries c2 on cc.country_id = c2.id
where c.slug = @ComposerSlug
group by c.id, c.last_name, c.first_name, c.year_born, c.year_died
order by c.last_name
";
            var parameters = new SqlParam[] {new("ComposerSlug", slug)};
            return await Extract<Composer>(db.Connection, sql, parameters);
        }

        public static async Task<IEnumerable<Period>> GetAllPeriods(AppDb db)
        {
            const string sql = @"
select json_agg(json_build_object(
                        'Id', p.id,
                        'Name', p.name,
                        'YearStart', p.year_start,
                        'YearEnd', p.year_end,
                        'Slug', p.slug,
                        'Composers', p.composers
                    ) order by p.year_start) as Json
from (select p.id,
             p.name,
             p.year_start,
             p.year_end,
             p.slug,
             json_agg(json_build_object(
                              'Id', c.id,
                              'LastName', c.last_name,
                              'FirstName', c.first_name,
                              'YearBorn', c.year_born,
                              'YearDied', c.year_died,
                              'Countries', c.countries,
                              'Slug', c.slug,
                              'WidipediaLink', c.wikipedia_link,
                              'ImslpLink', c.imslp_link) order by c.last_name) composers
      from periods p
               join (select c.id,
                            c.last_name,
                            c.first_name,
                            json_agg(c2.name) countries,
                            c.year_born,
                            c.year_died,
                            c.slug,
                            c.wikipedia_link,
                            c.imslp_link,
                            c.period_id
                     from composers c
                              join composers_countries cc on c.id = cc.composer_id
                              join countries c2 on cc.country_id = c2.id
                     group by c.id, c.last_name, c.first_name, c.year_born, c.year_died, c.slug, c.wikipedia_link,
                              c.imslp_link, c.period_id
      ) c on p.id = c.period_id
      group by p.id, p.name, p.year_start, p.year_end, p.slug) p;            
";
            return await Extract<IEnumerable<Period>>(db.Connection, sql, null);
        }

        public static async Task<IEnumerable<Genre>> GetWorksByComposer(AppDb db, int composerId)
        {
            const string sql = @"
select json_agg(json_build_object(
                        'Name', p.name,
                        'Icon', p.icon,
                        'Works', p.works
                    ) order by p.name) json
from (select g.name,
             g.icon,
             json_agg(json_build_object(
                              'Id', w.id,
                              'Title', w.title,
                              'YearStart', w.year_start,
                              'YearFinish', w.year_finish,
                              'AverageMinutes', w.average_minutes,
                              'CatalogueName', c.name,
                              'CatalogueNumber', w.catalogue_number,
                              'CataloguePostfix', w.catalogue_postfix
                          ) order by w.year_start, w.catalogue_number) works
      from works w
               join works_genres wg on w.id = wg.work_id
               join genres g on wg.genre_id = g.id
               left join catalogues c on w.catalogue_id = c.id
      where w.composer_id = @ComposerId
      group by g.name,
               g.icon) p
";
            
            var parameters = new SqlParam[] {new("ComposerId", composerId)};
            return await Extract<IEnumerable<Genre>>(db.Connection, sql, parameters);
        }
    }
}