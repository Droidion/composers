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
        /// <summary>
        /// Factory for creating Postgres connections
        /// </summary>
        private readonly DbFactory _dbFactory;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="dbFactory">Postgres connections factory</param>
        public DbQuery(DbFactory dbFactory)
        {
            _dbFactory = dbFactory;
        }

        public async Task<IEnumerable<User>> GetUserByLogin(string login) =>
            await QueryWithDapper<User>(SqlQueries.UserByLogin, new {Login = login});

        /// <summary>
        /// Retrieves composer's info by their slug name. Does not contain works
        /// </summary>
        /// <param name="slug">Unique text id of the composer, like 'beethoven' or 'cpe-bach'</param>
        /// <returns>Composer info</returns>
        public async Task<Composer> GetComposerBySlug(string slug) =>
            await ExtractJson<Composer>(SqlQueries.ComposerBySlug, new SqlParam[] {new("ComposerSlug", slug)});

        /// <summary>
        /// Retrieves the composers grouped by the musical periods.
        /// </summary>
        /// <returns>Musical periods</returns>
        public async Task<IEnumerable<Period>> GetPeriodsAndComposers() =>
            await ExtractJson<IEnumerable<Period>>(SqlQueries.PeriodsAndComposers, null);

        /// <summary>
        /// Retrieves the work from a database by work's Id
        /// </summary>
        /// <param name="id">Work Id</param>
        /// <returns>Work object</returns>
        public async Task<IEnumerable<Work>> GetWorkById(int id) => await QueryWithDapper<Work>(SqlQueries.WorkById, new {Id = id});

        /// <summary>
        /// Retrieves the list of works that are children of a given parent work,
        /// For example, there is the parent work which is Bach's Violin Sonatas and Partitas, and it contains 6 individual works
        /// </summary>
        /// <param name="parentWorkId">Id of the parent work</param>
        /// <returns>List of works</returns>
        public async Task<IEnumerable<Work>> GetChildWorks(int parentWorkId) =>
            await QueryWithDapper<Work>(SqlQueries.ChildWorks, new {Id = parentWorkId});

        /// <summary>
        /// Retrieves the works of a certain composer grouped by the musical genres
        /// </summary>
        /// <param name="composerId">Composer's Id in the database</param>
        /// <returns>Composer's works grouped by genres</returns>
        public async Task<IEnumerable<Genre>> GetGenresAndWorksByComposer(int composerId) =>
            await ExtractJson<IEnumerable<Genre>>(SqlQueries.GenresAndWorksByComposer, new SqlParam[] {new("ComposerId", composerId)});

        /// <summary>
        /// Retrieves recordings of a certain work from a database
        /// </summary>
        /// <param name="workId">Work Id</param>
        /// <returns>List of recordings</returns>
        public async Task<IEnumerable<Recording>> GetRecordingsByWork(int workId) =>
            await ExtractJson<IEnumerable<Recording>>(SqlQueries.RecordingsByWork, new SqlParam[] {new("WorkId", workId)});

        /// <summary>
        /// Extracts JSON data from the Postgres database.
        /// </summary>
        /// <param name="sql">SQL request</param>
        /// <param name="parameters">Parameters for SQL request</param>
        /// <typeparam name="T">Return data</typeparam>
        /// <returns>Data instance</returns>
        private async Task<T> ExtractJson<T>(string sql, IEnumerable<SqlParam>? parameters)
        {
            await using var conn = _dbFactory.MakeConn();
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

            // Parse json into model
            try
            {
                var rawJson = reader.GetString(0);
                var json = JsonSerializer.Deserialize<T>(rawJson);
                if (json == null)
                {
                    throw new InvalidOperationException("JSON was parsed as null");
                }

                return json;
            }
            catch (Exception e)
            {
                throw new InvalidOperationException("Could not retrieve DB JSON data", e);
            }
        }

        /// <summary>
        /// Makes Postgres query using Dapper for mapping results
        /// </summary>
        /// <param name="sql">SQL query</param>
        /// <param name="parameters">Parameters for SQL query</param>
        /// <typeparam name="T">Type of mapped data to return</typeparam>
        /// <returns>Extracted data</returns>
        private async Task<IEnumerable<T>> QueryWithDapper<T>(string sql, object parameters)
        {
            await using var conn = _dbFactory.MakeConn();
            await conn.OpenAsync();
            return await conn.QueryAsync<T>(sql, parameters);
        }
    }
}