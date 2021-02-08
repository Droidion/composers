using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Music Label
    /// </summary>
    /// <example>Sony</example>
    /// <example>Ondine</example>
    [PublicAPI]
    public record Label
    {
        /// <summary>
        /// Label Id
        /// </summary>
        public int Id { get; init; }
        
        /// <summary>
        /// Label Name
        /// </summary>
        /// <example>EMI</example>
        public string Name { get; init; }
    }
}