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
            await db.Connection.OpenAsync();
            return await db.Connection.QueryAsync<Period>("SELECT * FROM periods ORDER BY year_start");
        }
    }
}