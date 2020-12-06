using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace Site.Pages
{
    public class ComposerModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public ComposerModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}