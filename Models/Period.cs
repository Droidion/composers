using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Period when composer lived and worked, like Late Baroque or Romanticism. 
    /// </summary>
    [PublicAPI]
    public record Period
    {
        /// <summary>
        /// Id in the database.
        /// </summary>
        public int Id { get; init; }
        
        /// <summary>
        /// Name of the period.
        /// </summary>
        /// <example>Late Baroque</example>
        public string Name { get; init; }
        
        /// <summary>
        /// Year when period roughly started.
        /// </summary>
        public int YearStart { get; init; }
        
        /// <summary>
        /// Year when period roughly ended. Can be null for the lasted period which is still ongoing.
        /// </summary>
        public int? YearEnd { get; init; }
        
        /// <summary>
        /// Unique period readable text id, to be used in URLs.
        /// </summary>
        /// <example>late-baroque</example>
        public string Slug { get; init; }
        
        /// <summary>
        /// Composers associated with the period.
        /// </summary>
        public Composer[] Composers { get; init; }
    };
}