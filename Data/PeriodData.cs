using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using Models;

namespace Data
{
    public static class PeriodData
    {
        public static async Task<IEnumerable<Period>> GetAllPeriods(AppDb db)
        {
            const string sql = "SELECT * FROM periods ORDER BY year_start";
            return await db.Connection.QueryAsync<Period>(sql);
        }
    }
}