using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Performer of some musical work
    /// </summary>
    [PublicAPI]
    public record Performer
    {
        /// <summary>
        /// First name. Can be null for performers like orchestras when LastName field should be used.
        /// </summary>
        /// <example>Herbert</example>
        public string? FirstName { get; init; }
        
        /// <summary>
        /// Last name.
        /// </summary>
        /// <example>von Karajan</example>
        /// <example>London Symphony Orchestra</example>
        public string LastName { get; init; }
        
        /// <summary>
        /// Display priority.
        /// Use when we want to enumerate the conductor before the orchestra 
        /// </summary>
        public int? Priority { get; init; }
        
        /// <summary>
        /// Instrument or role associated with the performer
        /// </summary>
        /// <example>Piano</example>
        /// <example>Conductor</example>
        public string? Instrument { get; init; }
    }
}