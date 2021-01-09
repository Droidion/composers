using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data;
using JetBrains.Annotations;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Models;

namespace Site.Pages
{
    
    /// <summary>
    /// Composer page showing a single composer's information and their work grouped by genres
    /// </summary>
    public class ComposerModel : PageModel
    {
        /// <summary>
        /// Logger service
        /// </summary>
        private readonly ILogger<ComposerModel> _logger;

        /// <summary>
        /// Service for making database queries
        /// </summary>
        private readonly DbQuery _dbQuery;
        
        /// <summary>
        /// Composer's works grouped by genres
        /// </summary>
        public IEnumerable<Genre> Genres { get; private set; } = Array.Empty<Genre>();
        
        /// <summary>
        /// Composer's info
        /// </summary>
        public Composer Composer { get; private set; } = new();

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="logger">Logger service</param>
        /// <param name="dbQuery">Service for making database queries</param>
        public ComposerModel(ILogger<ComposerModel> logger, DbQuery dbQuery)
        {
            _dbQuery = dbQuery;
            _logger = logger;
        }

        /// <summary>
        /// GET /{composer-slug}
        /// </summary>
        /// <param name="slug">Unique text Id of the composer, like 'beethoven' or 'cpe-bach'</param>
        /// <returns>Composer's information, works grouped by genres</returns>
        [PublicAPI]
        public async Task OnGet(string slug)
        {
            try
            {
                Composer = await _dbQuery.GetComposerBySlug(slug);
                Genres = await _dbQuery.GetGenresAndWorksByComposer(Composer.Id);
            }
            catch (Exception e)
            {
                _logger.LogError(e.ToString());
            }
        }
    }
}