using System;

namespace Helpers
{
    public static class StringHelpers
    {
        public static string FormatYearsRange(int startYear, int? finishYear)
        {
            var startYearStr = startYear.ToString();
            var finishYearStr = finishYear.ToString();
            var startYearOutput = $"{startYearStr}&ndash;";

            if (startYearStr.Length != 4) throw new ArgumentException($"Start year should consist of 4 digits, got {startYear}");

            if (!finishYear.HasValue) return startYearOutput;

            return startYearStr.Substring(0, 2).Equals(finishYearStr.Substring(0, 2))
                ? $"{startYearOutput}{finishYearStr.Substring(finishYearStr.Length - 2)}"
                : $"{startYearOutput}{finishYearStr}";
        }
        
        public static string FormatYearsRange(int? startYear, int? finishYear)
        {
            var startYearStr = startYear.ToString();
            var finishYearStr = finishYear.ToString();

            if (startYear.HasValue && !finishYear.HasValue) return startYearStr;
            if (!startYear.HasValue && finishYear.HasValue) return finishYearStr;
            if (!startYear.HasValue && !finishYear.HasValue) return "";
            
            return startYearStr.Substring(0, 2).Equals(finishYearStr.Substring(0, 2))
                ? $"{startYearStr}&ndash;{finishYearStr.Substring(finishYearStr.Length - 2)}"
                : $"{startYearStr}&ndash;{finishYearStr}";
            
        }
    }
}