namespace Models
{
    public record Work(
        int Id,
        string Title,
        int? YearStart,
        int? YearFinish,
        int AverageMinutes,
        string? CatalogueName,
        int? CatalogueNumber,
        string? CataloguePostfix
    );
}