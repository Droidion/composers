namespace Models
{
    public record Genre(
        string Name,
        string Icon,
        Work[] Works
    );
}