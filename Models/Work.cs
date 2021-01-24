using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Musical work, like Symphony No. 9 by Beethoven
    /// </summary>
    [PublicAPI]
    public record Work
    {
        /// <summary>
        /// Id in the database.
        /// </summary>
        public int Id { get; init; }

        /// <summary>
        /// Work title.
        /// </summary>
        /// <example>Faust Symphony</example>
        public string Title { get; init; }

        /// <summary>
        /// Year when composer started the work, if known.
        /// Can be used without YearFinish if the work was finished in a single year.
        /// </summary>
        public int? YearStart { get; init; }

        /// <summary>
        /// Year when composer finished the work, if known.
        /// Can be used without YearStart if the work was finished in a single year.
        /// </summary>
        public int? YearFinish { get; init; }

        /// <summary>
        /// Approximate length of the work in minutes.
        /// Summarization of several recordings, does not need to be exact, just like 30 minutes vs 2 hours.
        /// </summary>
        public int AverageMinutes { get; init; }

        /// <summary>
        /// Name of the catalogue of composer's works, like "BWV" for Bach or "Op." for Beethoven.
        /// </summary>
        public string? CatalogueName { get; init; }

        /// <summary>
        /// Catalogue number of the work.
        /// </summary>
        /// <example><c>123</c> for the work of <c>Op. 123</c></example>
        public int? CatalogueNumber { get; init; }

        /// <summary>
        /// Postfix for the number of the work in the catalogue.
        /// </summary>
        /// <example><c>b</c> in the <c>Op. 123b</c></example>
        public string? CataloguePostfix { get; init; }

        /// <summary>
        /// Work key.
        /// </summary>
        /// <example>C# minor</example>
        public string? Key { get; init; }

        /// <summary>
        /// Work number in some sequence. 
        /// </summary>
        /// <example><c>9</c> for the Beethoven's Symphony No. 9</example>
        public int? No { get; init; }

        /// <summary>
        /// Nickname of the work
        /// </summary>
        /// <example><c>Great</c> for the Beethoven's Symphony No. 9</example>
        public string? Nickname { get; init; }
    }
}