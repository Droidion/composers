using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;
using Dapper;
using Models;
using Npgsql;

namespace Data
{
    /// <summary>
    /// Parameter for an SQL query.
    /// </summary>
    internal record SqlParam(string Key, object Value);
    
    /// <summary>
    /// Postgres database queries.
    /// </summary>
    public class DbQuery
    {
        private readonly DbFactory _DbFactory;

        public DbQuery(DbFactory dbFactory)
        {
            _DbFactory = dbFactory;
        }

        /// <summary>
        /// Retrieves composer's info by their slug name. Does not contain works
        /// </summary>
        /// <param name="slug">Unique text id of the composer, like 'beethoven' or 'cpe-bach'</param>
        /// <returns>Composer info</returns>
        public async Task<Composer> GetComposerBySlug(string slug)
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
            return await ExtractJson<Composer>(sql, parameters);
        }

        /// <summary>
        /// Retrieves the composers grouped by the musical periods.
        /// </summary>
        /// <returns>Musical periods</returns>
        public async Task<IEnumerable<Period>> GetPeriodsAndComposers()
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
            return await ExtractJson<IEnumerable<Period>>(sql, null);
        }

        /// <summary>
        /// Retrieves the work from a database by work's Id
        /// </summary>
        /// <param name="id">Work Id</param>
        /// <returns>Work object</returns>
        public async Task<IEnumerable<Work>> GetWorkById(int id)
        {
            var sql = @"
select w.id,
       w.title,
       w.year_start,
       w.year_finish,
       w.average_minutes,
       c.name as catalogue_name,
       w.catalogue_number,
       w.catalogue_postfix,
       k.name as key,
       w.no
from works w
         left join catalogues c on w.catalogue_id = c.id
         left join keys k on w.key_id = k.id
where w.id = @Id;
        ";
            await using var conn = _DbFactory.MakeConn();
            await conn.OpenAsync();
            
            var works = await conn.QueryAsync<Work>(sql, new {Id = id});
            return works;
        }
        
        /// <summary>
        /// Retrieves the list of works that are children of a given parent work,
        /// For example, there is the parent work which is Bach's Violin Sonatas and Partitas, and it contains 6 individual works
        /// </summary>
        /// <param name="parentWorkId">Id of the parent work</param>
        /// <returns>List of works</returns>
        public async Task<IEnumerable<Work>> GetChildWorks(int parentWorkId)
        {
            var sql = @"
select w.id,
       w.title,
       w.year_start,
       w.year_finish,
       w.average_minutes,
       c.name as catalogue_name,
       w.catalogue_number,
       w.catalogue_postfix,
       k.name as key,
       w.no
from works w
         left join catalogues c on w.catalogue_id = c.id
         left join keys k on w.key_id = k.id
where w.parent_work_id = @Id
order by no, catalogue_number, catalogue_postfix;
        ";
            
            await using var conn = _DbFactory.MakeConn();
            await conn.OpenAsync();
            
            var works = await conn.QueryAsync<Work>(sql, new {Id = parentWorkId});
            return works;
        }

        /// <summary>
        /// Retrieves the works of a certain composer grouped by the musical genres
        /// </summary>
        /// <param name="composerId">Composer's Id in the database</param>
        /// <returns>Composer's works grouped by genres</returns>
        public async Task<IEnumerable<Genre>> GetGenresAndWorksByComposer(int composerId)
        {
            const string sql = @"
select json_agg(json_build_object(
                        'Name', g.name,
                        'Icon', g.icon,
                        'Works', g.works
                    ) order by g.name) json
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
                              'CataloguePostfix', w.catalogue_postfix,
                              'Key', k.name,
                              'No', w.no
                          ) order by w.year_start, w.catalogue_number) works
      from works w
               join works_genres wg on w.id = wg.work_id
               join genres g on wg.genre_id = g.id
               left join catalogues c on w.catalogue_id = c.id
               left join keys k on w.key_id = k.id
      where w.composer_id = @ComposerId
      group by g.name,
               g.icon) g
";
            
            var parameters = new SqlParam[] {new("ComposerId", composerId)};
            return await ExtractJson<IEnumerable<Genre>>(sql, parameters);
        }
        
        /// <summary>
        /// Retrieves recordings of a certain work from a database
        /// </summary>
        /// <param name="workId">Work Id</param>
        /// <returns>List of recordings</returns>
        public async Task<IEnumerable<Recording>> GetRecordingsByWork(int workId)
        {
            const string sql = @"
select json_agg(json_build_object(
                        'Id', w.Id,
                        'CoverName', w.cover_name,
                        'Performers', w.performers,
                        'Label', w.name,
                        'Length', w.length,
                        'Streamers', w.streamers
                    ) order by w.last_name) json
from (select r.id,
             r.cover_name,
             json_agg(json_build_object(
                 'FirstName', p.first_name,
                 'LastName', p.last_name,
                 'Priority', pri.priority
                 )) performers,
             p.first_name,
             p.last_name,
             l.name,
             r.length,
             json_agg(json_build_object('Name', s.name,
                                        'Icon', s.icon_name,
                                        'Link', rs.link) order by s.name) streamers
      from recordings r
               join performers_recordings_instruments pri on r.id = pri.recording_id
               join performers p on pri.performer_id = p.id
               join labels l on r.label_id = l.id
               join recordings_streamers rs on r.id = rs.recording_id
               join streamers s on rs.streamer_id = s.id
               join instruments i on pri.instrument_id = i.id
      where r.work_id = @WorkId
      group by r.id,
               r.cover_name,
               p.first_name,
               p.last_name,
               l.name,
               r.length) w
";
            
            var parameters = new SqlParam[] {new("WorkId", workId)};
            return await ExtractJson<IEnumerable<Recording>>(sql, parameters);
        }

        /// <summary>
        /// Extracts JSON data from the Postgres database.
        /// </summary>
        /// <param name="sql">SQL request</param>
        /// <param name="parameters">Parameters for SQL request</param>
        /// <typeparam name="T">Return data</typeparam>
        /// <returns>Data instance</returns>
        /// <exception cref="InvalidOperationException">Could not parse DB JSON data</exception>
        private async Task<T> ExtractJson<T>(string sql, IEnumerable<SqlParam>? parameters)
        {
            await using var conn = _DbFactory.MakeConn();
            await conn.OpenAsync();
            
            // Create SQL command
            await using var cmd = new NpgsqlCommand(sql, conn);
            
            // Add parameters for SQL command
            if (parameters != null)
                foreach (var (key, value) in parameters)
                {
                    cmd.Parameters.AddWithValue(key, value);
                }

            // Read data as a single string
            await using var reader = await cmd.ExecuteReaderAsync();
            await reader.ReadAsync();
            var rawJson = reader.GetString(0);
            
            // Parse json into model
            var json = JsonSerializer.Deserialize<T>(rawJson);
            if (json == null)
            {
                throw new InvalidOperationException("Could not parse DB JSON data");
            }

            return json;
        }
    }
}