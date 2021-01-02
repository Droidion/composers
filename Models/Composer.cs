namespace Models
{
    public record Composer
    {
        public int Id { get; }
        public string LastName { get; }
        public string FirstName { get; }
        public int YearBorn { get; }
        public int? YearDied { get; }
        public string Countries { get; }
        public string Slug { get; }
        public string? WikipediaLink { get; }
        public string? ImslpLink { get; }
    }
}