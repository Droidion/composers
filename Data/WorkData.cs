using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Models;

namespace Data
{
    public class WorkData
    {
        public static async Task<IEnumerable<Genre>> GetWorksByComposer(AppDb db, int composerId)
        {
            const string sql = @"select g.name,
                   g.icon,
                   w.id,
                   w.title,
                   w.year_start,
                   w.year_finish,
                   w.average_minutes,
                   c.name catalogue_name,
                   w.catalogue_number,
                   w.catalogue_postfix
                from works w
                         join works_genres wg on w.id = wg.work_id
                         join genres g on wg.genre_id = g.id
                         left join catalogues c on w.catalogue_id = c.id
                where w.composer_id = @ComposerId
                order by g.name, w.year_start, w.catalogue_number";

            var genreDict = new Dictionary<string, Genre>();
            var works = await db.Connection.QueryAsync<Genre, Work, Genre>(sql, (genre, work) =>
            {
                Genre genreEntry;
                if (!genreDict.TryGetValue(genre.Name, out genreEntry))
                {
                    genreEntry = genre;
                    genreEntry.Works = new List<Work>();
                    genreDict.Add(genreEntry.Name, genreEntry);
                }
                
                genreEntry.Works.Add(work);
                return genreEntry;

            }, new {ComposerId = composerId}, splitOn: "title");
            return works.Distinct();
        }
    }
}