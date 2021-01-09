using System;
using System.Linq;
using System.Threading.Tasks;
using Data;
using JetBrains.Annotations;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Models;

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

        [PublicAPI]
        public async Task OnGet(string composerSlug, int workId)
        {
            try
            {
                var composerTask = _dbQuery.GetComposerBySlug(composerSlug);
                var workTask = _dbQuery.GetWorkById(workId);
                var recordingsTask = _dbQuery.GetRecordingsByWork(workId);
                var childWorksTask = _dbQuery.GetChildWorks(workId);
                
                await Task.WhenAll(composerTask, workTask, recordingsTask, childWorksTask);

                Composer = composerTask.Result;
                Work = workTask.Result.ToArray()[0];
                Recordings = recordingsTask.Result.ToArray();
                ChildWorks = childWorksTask.Result.ToArray();
            }
            catch (Exception e)
            {
                _logger.LogError(e.ToString());
            }
        }
    }
}