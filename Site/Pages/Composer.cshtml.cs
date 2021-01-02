using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Models;

namespace Site.Pages
{
    public class ComposerModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private AppDb Db { get; set; }
        public IEnumerable<Genre> Genres { get; set; }
        public Composer Composer { get; set; }

        public ComposerModel(ILogger<IndexModel> logger, AppDb db)
        {
            Db = db;
            _logger = logger;
        }

        public async Task OnGet(string slug)
        {
            await Db.Connection.OpenAsync();
            Composer = (await ComposerData.GetComposerBySlug(Db, slug)).ToArray()[0];
            Genres = await WorkData.GetWorksByComposer(Db, Composer.Id);
        }
    }
}