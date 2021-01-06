namespace Models
{
    public record Composer(
        int Id,
        string LastName,
        string FirstName,
        int YearBorn,
        int? YearDied,
        string[] Countries,
        string Slug,
        string? WikipediaLink,
        string? ImslpLink
    );
}