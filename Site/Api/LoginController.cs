using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Isopoh.Cryptography.Argon2;
using Jose;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Models;

namespace Site.Api
{
    /// <summary>
    /// Endpoints for working with authorization tokens
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        /// <summary>
        /// Service for making database queries
        /// </summary>
        private readonly DbQuery _dbQuery;

        /// <summary>
        /// Global system config
        /// </summary>
        private readonly IConfiguration _configuration;

        public LoginController(DbQuery dbQuery, IConfiguration configuration)
        {
            _dbQuery = dbQuery;
            _configuration = configuration;
        }

        /// <summary>
        /// GET /api/login
        /// Searches for user in the database, checks the password, generates JWT.
        /// </summary>
        /// <param name="user">User's login and password</param>
        /// <returns>JWT</returns>
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> Post([FromBody] User user)
        {
            try
            {
                var users = (await _dbQuery.GetUserByLogin(user.Login)).ToArray();
                if (!users.Any())
                {
                    return Unauthorized("User not found");
                }

                var verificationResult = Argon2.Verify(users[0].Password, user.Password);
                if (!verificationResult)
                {
                    return Unauthorized("Password incorrect");
                }

                var token = CreateToken(user.Login);
                return Ok(token);
            }
            catch (Exception e)
            {
                return Unauthorized("DB problem");
            }
        }

        /// <summary>
        /// Creates JWT with the given login
        /// </summary>
        /// <param name="login">User login</param>
        /// <returns>JWT</returns>
        private string CreateToken(string login)
        {
            var payload = new Dictionary<string, object>
            {
                { "sub", login },
                { "exp", DateTimeOffset.Now.AddHours(1).ToUnixTimeSeconds() }
            };

            var secretKey = Encoding.UTF8.GetBytes(_configuration["SecretKey"]);

            return JWT.Encode(payload, secretKey, JwsAlgorithm.HS256);
        }
    }
}