using System.Collections.Generic;

namespace Models
{
    public record Period
    {
        public int Id { get; }
        public string Name { get; }
        public int YearStart { get; }
        public int? YearEnd { get; }
        public string Slug { get; }
        public Composer[]? Composers { get; set; }
    }
}