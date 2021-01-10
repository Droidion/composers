using JetBrains.Annotations;

namespace Models
{
    /// <summary>
    /// Recording of a musical work.
    /// </summary>
    [PublicAPI]
    public record Recording
    {
        /// <summary>
        /// Id in the database.
        /// </summary>
        public int Id { get; init; }
        
        /// <summary>
        /// Filename of recording cover.
        /// It can be an album cover, or composite picture of several albums, or just some generic placeholder.
        /// </summary>
        /// <example>foo.webp</example>
        public string CoverName { get; init; }
        
        /// <summary>
        /// Year when recording started. For single year either YearStart or YearFinish can be used.
        /// </summary>
        public int? YearStart { get; init; }
        
        /// <summary>
        /// Year when recording finished. For single year either YearStart or YearFinish can be used.
        /// </summary>
        public int? YearFinish { get; init; }
        
        /// <summary>
        /// List of performers associated with the recordings.
        /// </summary>
        public Performer[] Performers { get; init; }
        
        /// <summary>
        /// Label which released the recording.
        /// </summary>
        /// <example>Ondine</example>
        public string? Label { get; init; }
        
        /// <summary>
        /// Length of the recording in minutes.
        /// </summary>
        public int Length { get; init; }
        
        /// <summary>
        /// List of streaming services which can stream the recording.
        /// </summary>
        public Streamer[] Streamers { get; init; }
    }
}