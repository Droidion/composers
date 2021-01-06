using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Dapper;
using Models;

namespace Data
{
    public class WorkData
    {
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

            var json = (await db.Connection.QueryAsync<DbJsonOutput>(sql, new {ComposerId = composerId})).ToArray();
            return JsonSerializer.Deserialize<IEnumerable<Genre>>(json[0].Json);
        }
    }
}