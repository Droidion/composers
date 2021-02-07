namespace Models
{
    public record User
    {
        public string Login { get; init; }
        public string Password { get; init; }
    }
}