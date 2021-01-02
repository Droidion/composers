using System.Collections.Generic;

namespace Models
{
    public record Genre
    {
        public string Name { get; }
        public string Icon { get; }
        public List<Work>? Works { get; set; }
    }
}