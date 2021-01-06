using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Extractor for database queries returning json as a single string
    /// </summary>
    [PublicAPI]
    public record DbJsonOutput
    {
        /// <summary>
        /// JSON data as string
        /// </summary>
        public string Json { get; init; }
    }
}