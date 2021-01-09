using JetBrains.Annotations;

namespace Models
{
    [PublicAPI]
    public record Streamer
    {
        public string Name { get; init; }
        public string Icon { get; init; }
        public string Link { get; init; }
    }
}