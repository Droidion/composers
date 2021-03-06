﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Models;
using Data;
using JetBrains.Annotations;
using Sentry;

namespace Site.Pages
{
    /// <summary>
    /// Main page showing all composers grouped by musical periods
    /// </summary>
    public class IndexModel : PageModel
    {
        /// <summary>
        /// Logger service
        /// </summary>
        private readonly ILogger<IndexModel> _logger;

        /// <summary>
        /// Service for making database queries
        /// </summary>
        private readonly DbQuery _dbQuery;

        /// <summary>
        /// Composers grouped by musical periods
        /// </summary>
        public IEnumerable<Period> Periods { get; private set; }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="logger">Logger service</param>
        /// <param name="dbQuery">Service for making database queries</param>
        public IndexModel(ILogger<IndexModel> logger, DbQuery dbQuery)
        {
            Periods = Array.Empty<Period>();
            _dbQuery = dbQuery;
            _logger = logger;
        }

        /// <summary>
        /// GET /
        /// </summary>
        /// <returns>Composers grouped by musical periods</returns>
        [PublicAPI]
        public async Task OnGet()
        {
            try
            {
                Periods = await _dbQuery.GetPeriodsAndComposers();
            }
            catch (Exception e)
            {
                SentrySdk.CaptureException(e);
            }
        }
    }
}