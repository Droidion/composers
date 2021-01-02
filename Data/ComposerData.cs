using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using Models;

namespace Data
{
    public static class ComposerData
    {
        public static async Task<IEnumerable<Composer>> GetComposersByPeriod(AppDb db, int period)
        {
            const string sql = @"select c.id,
                c.last_name,
                c.first_name,
                c.year_born,
                c.year_died,
                string_agg(c2.name, ', ' order by c2.name) countries,
                c.slug,
                c.wikipedia_link,
                c.imslp_link
            from composers as c
                join composers_countries cc on c.id = cc.composer_id
                join countries c2 on cc.country_id = c2.id
            where c.period_id = @Period_Id
            group by c.id, c.last_name, c.first_name, c.year_born, c.year_died
            order by c.last_name";
            return await db.Connection.QueryAsync<Composer>(sql, new {Period_Id = period});
        }

        public static async Task<IEnumerable<Composer>> GetComposerBySlug(AppDb db, string slug)
        {
            const string sql = @"select c.id,
                c.last_name,
                c.first_name,
                c.year_born,
                c.year_died,
                string_agg(c2.name, ', ' order by c2.name) countries,
                c.slug,
                c.wikipedia_link,
                c.imslp_link
            from composers as c
                join composers_countries cc on c.id = cc.composer_id
                join countries c2 on cc.country_id = c2.id
            where c.slug = @ComposerSlug
            group by c.id, c.last_name, c.first_name, c.year_born, c.year_died
            order by c.last_name";
            return await db.Connection.QueryAsync<Composer>(sql, new {ComposerSlug = slug});
        }
    }
}