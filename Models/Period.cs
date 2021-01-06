namespace Models
{
    public record Period(
        int Id,
        string Name,
        int YearStart,
        int? YearEnd,
        string Slug,
        Composer[] Composers
    );
}