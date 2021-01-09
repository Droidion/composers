using JetBrains.Annotations;

namespace Models
{
    [PublicAPI]
    public record Recording
    {
        public int Id { get; init; }
        public string CoverName { get; init; }
        public Performer[] Performers { get; init; }
        public string? Label { get; init; }
        public int Length { get; init; }
        public Streamer[] Streamers { get; init; }
    }
}