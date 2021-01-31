using System;
using System.Linq;
using System.Threading.Tasks;
using Data;
using JetBrains.Annotations;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Models;
using Sentry;

namespace Site.Pages
{
    public class WorkModel : PageModel
    {
        /// <summary>
        /// Logger service
        /// </summary>
        private readonly ILogger<WorkModel> _logger;
        
        /// <summary>
        /// Service for making database queries
        /// </summary>
        private readonly DbQuery _dbQuery;
        
        public Recording[] Recordings { get; private set; } = Array.Empty<Recording>();
        
        /// <summary>
        /// Composer's info
        /// </summary>
        public Composer Composer { get; private set; } = new();
        
        /// <summary>
        /// Works's info
        /// </summary>
        public Work Work { get; private set; } = new();
        
        /// <summary>
        /// Works that have parent works. Like, individual sonatas of Beethoven's Late Piano Sonatas
        /// </summary>
        public Work[] ChildWorks { get; private set; } = Array.Empty<Work>();

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="logger">Logger service</param>
        /// <param name="dbQuery">Service for making database queries</param>
        public WorkModel(ILogger<WorkModel> logger, DbQuery dbQuery)
        {
            _dbQuery = dbQuery;
            _logger = logger;
        }

        /// <summary>
        /// GET /composer/{composerSlug}/work/{workId}
        /// </summary>
        /// <param name="composerSlug">Composer's unique string identifier, like 'cpe-bach'</param>
        /// <param name="workId">Work Id</param>
        /// <returns>Recordings of a certain work</returns>
        [PublicAPI]
        public async Task OnGet(string composerSlug, int workId)
        {
            try
            {
                Composer = await _dbQuery.GetComposerBySlug(composerSlug);
            }
            catch (Exception e)
            {
                SentrySdk.CaptureException(e);
            }
            
            try
            {
                Work = (await _dbQuery.GetWorkById(workId)).ToArray()[0];
            }
            catch (Exception e)
            {
                SentrySdk.CaptureException(e);
            }
            
            try
            {
                Recordings = (await _dbQuery.GetRecordingsByWork(workId)).ToArray();
            }
            catch (Exception e)
            {
                SentrySdk.CaptureException(e);
            }
            
            try
            {
                ChildWorks = (await _dbQuery.GetChildWorks(workId)).ToArray();
            }
            catch (Exception e)
            {
                SentrySdk.CaptureException(e);
            }
        }
    }
}