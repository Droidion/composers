using Npgsql;

namespace Data
{
    public class DbFactory
    {
        private readonly string _connectionString;

        public DbFactory(string connectionString)
        {
            _connectionString = connectionString;
        }

        public NpgsqlConnection MakeConn()
        {
            return new(_connectionString);
        }
    }
}