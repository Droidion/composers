using JetBrains.Annotations;

namespace Models
{
    [PublicAPI]
    public class Performer
    {
        public string? FirstName { get; init; }
        public string LastName { get; init; }
        public int? Priority { get; init; }
        public string? Instrument { get; init; }
    }
}