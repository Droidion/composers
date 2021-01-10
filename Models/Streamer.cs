using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Streaming service, like Spotify, Tidal, or Apple Music.
    /// </summary>
    [PublicAPI]
    public record Streamer
    {
        /// <summary>
        /// Name of the service
        /// </summary>
        /// <example>Tidal</example>
        public string Name { get; init; }
        
        /// <summary>
        /// Logo filename
        /// </summary>
        /// <example>foo.webp</example>
        public string Icon { get; init; }
        
        /// <summary>
        /// Link to the album or playlist
        /// </summary>
        /// <example>album/3843182</example>
        public string Link { get; init; }
        
        /// <summary>
        /// First part of the links URLs
        /// </summary>
        /// <example>spotify://</example>
        public string Prefix { get; init; }
    }
}