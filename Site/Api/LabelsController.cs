using System;
using System.Linq;
using System.Threading.Tasks;
using Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Site.Api
{
    /// <summary>
    /// API Endpoints for operations on music labels
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class LabelsController : ControllerBase
    {
        /// <summary>
        /// Service for making database queries
        /// </summary>
        private readonly DbQuery _dbQuery;
        
        public LabelsController(DbQuery dbQuery)
        {
            _dbQuery = dbQuery;
        }
        
        /// <summary>
        /// List of all labels
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Get()
        {
            try
            {
                var labels = (await _dbQuery.GetLabels()).ToArray();
                return Ok(labels);
            }
            catch (Exception e)
            {
                return BadRequest("DB problem");
            }
        }
    }
}