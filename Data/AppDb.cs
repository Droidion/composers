using System;
using Npgsql;

namespace Data
{
    public class AppDb : IDisposable
    {
        public NpgsqlConnection Connection { get; }

        public AppDb(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            Connection = new NpgsqlConnection(connectionString);
        }

        public void Dispose() => Connection.Dispose();
    }
}