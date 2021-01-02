namespace Models
{
    public record Work
    {
        public int Id { get; }
        public string Title { get; }
        public int? YearStart { get; }
        public int? YearFinish { get; }
        public int AverageMinutes { get; }
        public string? CatalogueName { get; }
        public int? CatalogueNumber { get; }
        public string? CataloguePostfix { get; }
    }
}