namespace Helpers

open System

/// Helper functions related to string operations
module StringHelpers =
    /// Formats the range of two years into the string, e.g. "1720–95", or "1720–1805", or "1720–"
    /// Start year and dash are always present
    /// It's supposed to be used for lifespans, meaning we always have birth, but may not have death
    let formatYearsRangeStrict (startYear : int, finishYear : Nullable<int>) : string =
        match (string startYear, string finishYear) with
        | (start, _) when start.Length <> 4 -> raise (ArgumentException($"Start year should consist of 4 digits, got {startYear}"))
        | (start, "") -> $"{start}–"
        | (start, finish) when start.[..1].Equals(finish.[..1]) -> $"{start}–{finish.[2..3]}"
        | (start, finish) -> $"{start}–{finish}"
        | (_, _) -> ""
        
    /// Formats the range of two years into a string, e.g. "1720–95", or "1720–1805", or "1720"
    /// Both years can be present or absent, so it's a more generic, loose form
    let formatYearsRangeLoose (startYear : Nullable<int>, finishYear : Nullable<int>) : string =
        match (string startYear, string finishYear) with
        | (start, "") -> start
        | ("", finish) -> finish
        | (start, finish) when start.[..1].Equals(finish.[..1]) -> $"{start}–{finish.[2..3]}"
        | (start, finish) -> $"{start}–{finish}"
        | (_, _) -> ""
        
    /// Formats minutes into a string with hours and minutes, like "2h 35m"
    let formatWorkLength (lengthInMinutes : int) : string =
        let hours = lengthInMinutes / 60
        let minutes = lengthInMinutes % 60
        match (hours, minutes) with
        | (0, 0) -> ""
        | (0, m) -> $"{m}m"
        | (h, 0) -> $"{h}h"
        | (h, m) -> $"{h}h {m}m"