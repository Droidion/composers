using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Dapper;
using Models;

namespace Data
{
    public static class ComposerData
    {
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
            var json = (await db.Connection.QueryAsync<DbJsonOutput>(sql, new {ComposerSlug = slug})).ToArray();
            return JsonSerializer.Deserialize<Composer>(json[0].Json);
        }
    }
}