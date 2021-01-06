using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Dapper;
using Models;

namespace Data
{
    public static class PeriodData
    {
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
            var json = (await db.Connection.QueryAsync<DbJsonOutput>(sql)).ToArray();
            return JsonSerializer.Deserialize<IEnumerable<Period>>(json[0].Json);
        }
    }
}