using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data;
using Isopoh.Cryptography.Argon2;
using Jose;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace Site.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        /// <summary>
        /// Service for making database queries
        /// </summary>
        private readonly DbQuery _dbQuery;

        public LoginController(DbQuery dbQuery)
        {
            _dbQuery = dbQuery;
        }

        [HttpPost]
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

        private string CreateToken(string login)
        {
            var payload = new Dictionary<string, object>()
            {
                { "sub", login },
                { "exp", 1300819380 }
            };

            var secretKey = new byte[]{164,60,194,0,161,189,41,38,130,89,141,164,45,170,159,209,69,137,243,216,191,131,47,250,32,107,231,117,37,158,225,234};

            return JWT.Encode(payload, secretKey, JwsAlgorithm.HS256);
        }
    }
}