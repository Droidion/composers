using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Composer, like Bach or Beethoven.
    /// </summary>
    [PublicAPI]
    public record Composer
    {
        /// <summary>
        /// Id in the database.
        /// </summary>
        public int Id { get; init; }
        /// <summary>
        /// First name, like Ludwig van.
        /// </summary>
        public string FirstName { get; init; }
        /// <summary>
        /// Last name, like Beethoven.
        /// </summary>
        public string LastName { get; init; }
        /// <summary>
        /// Year composer was born.
        /// </summary>
        public int YearBorn { get; init; }
        /// <summary>
        /// Year composer died, can be null for alive composers.
        /// </summary>
        public int? YearDied { get; init; }
        /// <summary>
        /// Countries composer is associated with.
        /// </summary>
        public string[] Countries { get; init; }
        /// <summary>
        /// Unique composer readable text id, to be used in URLs, like 'beethoven' for Ludwig van Beethoven.
        /// </summary>
        public string Slug { get; init; }
        /// <summary>
        /// Link to composer's wikipedia page.
        /// </summary>
        public string? WikipediaLink { get; init; }
        /// <summary>
        /// Link to composer's IMSLP page with the list of all works.
        /// </summary>
        public string? ImslpLink { get; init; }
    }
}