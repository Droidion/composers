namespace Helpers

open System

/// Helper functions related to string operations
module StringHelpers =
    /// Checks if given string is a 4 digits number, like "1234" (not "-123", "123", or "12345")
    let private validDigits (str : string) : bool =
        str.Length = 4 && str.[0] <> '-'
        
    /// Checks if two given string have the same first two letters, like "1320" and "1399"
    let private centuryEqual (str1 : string) (str2: string) : bool=
        str1.[..1].Equals(str2.[..1])
    
    /// Formats the range of two years into the string, e.g. "1720–95", or "1720–1805", or "1720–"
    /// Start year and dash are always present
    /// It's supposed to be used for lifespans, meaning we always have birth, but may not have death
    let public formatYearsRangeStrict (startYear : int, finishYear : Nullable<int>) : string =
        match (string startYear, string finishYear) with
        | (start, _) when start |> validDigits |> not -> ""
        | (start, "") -> $"{start}–"
        | (start, finish) when finish |> validDigits |> not -> $"{start}–"
        | (start, finish) when centuryEqual start finish -> $"{start}–{finish.[2..3]}"
        | (start, finish) -> $"{start}–{finish}"
        | (_, _) -> ""
        
    /// Formats the range of two years into a string, e.g. "1720–95", or "1720–1805", or "1720"
    /// Both years can be present or absent, so it's a more generic, loose form
    let public formatYearsRangeLoose (startYear : Nullable<int>, finishYear : Nullable<int>) : string =
        match (string startYear, string finishYear) with
        | (start, finish) when start |> validDigits && finish |> validDigits |> not -> start
        | (start, finish) when start |> validDigits |> not && finish |> validDigits -> finish
        | (start, finish) when start |> validDigits |> not && finish |> validDigits |> not -> ""
        | (start, finish) when centuryEqual start finish -> $"{start}–{finish.[2..3]}"
        | (start, finish) -> $"{start}–{finish}"
        | (_, _) -> ""
        
    /// Formats minutes into a string with hours and minutes, like "2h 35m"
    let public formatWorkLength (lengthInMinutes : int) : string =
        let hours = lengthInMinutes / 60
        let minutes = lengthInMinutes % 60
        match (hours, minutes) with
        | (0, 0)  -> ""
        | (h, m) when h < 0 || m < 0 -> ""
        | (0, m) -> $"{m}m"
        | (h, 0) -> $"{h}h"
        | (h, m) -> $"{h}h {m}m"