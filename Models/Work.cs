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
        /// Work title, like Symphony No. 9.
        /// </summary>
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
        /// Approximate length of the work. Summarization of several recordings, does not need to be exact, just like 30 minutes vs 2 hours.
        /// </summary>
        public int AverageMinutes { get; init; }
        /// <summary>
        /// Name of the catalogue of composer's works, like "BWV" for Bach or "Op." for Beethoven.
        /// </summary>
        public string? CatalogueName { get; init; }
        /// <summary>
        /// Catalogue number of the work, like "123" for the of work of "Op. 123".
        /// </summary>
        public int? CatalogueNumber { get; init; }
        /// <summary>
        /// Postfix for the number of the work in the catalogue, like "b" in the "Op. 123b".
        /// </summary>
        public string? CataloguePostfix { get; init; }
    }
}