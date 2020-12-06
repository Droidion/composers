using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace Site.Pages
{
    public class WorkModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public WorkModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}