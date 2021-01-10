using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Genre of the work, like Symphony, or String Quartet, or Choral music.
    /// </summary>
    [PublicAPI]
    public record Genre
    {
        /// <summary>
        /// Name of the genre.
        /// </summary>
        /// <example>Late Baroque</example>
        public string Name { get; init; }
        
        /// <summary>
        /// Decorative icon.
        /// </summary>
        /// <example>🐕</example>
        public string Icon { get; init; }
        
        /// <summary>
        /// List of the works belonging to the genre.
        /// </summary>
        public Work[] Works { get; init; }
    }
}