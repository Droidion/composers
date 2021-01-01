using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Models;
using Data;

namespace Site.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        internal AppDb Db { get; set; }
        public IEnumerable<Period> Periods { get; set; }

        public IndexModel(ILogger<IndexModel> logger, AppDb db)
        {
            Db = db;
            _logger = logger;
        }

        public async Task OnGet()
        {
            Periods = await PeriodData.GetAllPeriods(Db);
        }
    }
}