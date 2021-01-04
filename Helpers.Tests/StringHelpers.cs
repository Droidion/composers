using Shouldly;
using Xunit;
using static Helpers.StringHelpers;

namespace Helpers.Tests
{
    public class StringHelpers
    {
        [Fact]
        public void formatYearsRangeStrict_FormatsAsExpected()
        {
            formatYearsRangeStrict(1920, null).ShouldBe("1920–");
            formatYearsRangeStrict(1930, 1950).ShouldBe("1930–50");
            formatYearsRangeStrict(1930, 2001).ShouldBe("1930–2001");
        }
        
        [Fact]
        public void formatYearsRangeStrict_HandlesProblemsGracefully()
        {
            formatYearsRangeStrict(20, 1234).ShouldBe("");
            formatYearsRangeStrict(12345, null).ShouldBe("");
            formatYearsRangeStrict(-123, null).ShouldBe("");
            formatYearsRangeStrict(1930, 12345).ShouldBe("1930–");
            formatYearsRangeStrict(1930, 12).ShouldBe("1930–");
            formatYearsRangeStrict(1234, -123).ShouldBe("1234–");
        }
        
        [Fact]
        public void formatYearsRangeLoose_FormatsAsExpected()
        {
            formatYearsRangeLoose(1920, null).ShouldBe("1920");
            formatYearsRangeLoose(1930, 1950).ShouldBe("1930–50");
            formatYearsRangeLoose(1930, 2001).ShouldBe("1930–2001");
            formatYearsRangeLoose(null, 2001).ShouldBe("2001");
        }
        
        [Fact]
        public void formatYearsRangeLoose_HandlesProblemsGracefully()
        {
            formatYearsRangeLoose(20, 1234).ShouldBe("1234");
            formatYearsRangeLoose(12345, null).ShouldBe("");
            formatYearsRangeLoose(-123, null).ShouldBe("");
            formatYearsRangeLoose(1930, 12345).ShouldBe("1930");
            formatYearsRangeLoose(1930, 12).ShouldBe("1930");
            formatYearsRangeLoose(1234, -123).ShouldBe("1234");
        }
        
        [Fact]
        public void formatWorkLength_FormatsAsExpected()
        {
            formatWorkLength(1).ShouldBe("1m");
            formatWorkLength(30).ShouldBe("30m");
            formatWorkLength(60).ShouldBe("1h");
            formatWorkLength(95).ShouldBe("1h 35m");
            formatWorkLength(240).ShouldBe("4h");
            formatWorkLength(245).ShouldBe("4h 5m");
        }
        
        [Fact]
        public void formatWorkLength_HandlesProblemsGracefully()
        {
            formatWorkLength(0).ShouldBe("");
            formatWorkLength(-1).ShouldBe("");
        }
    }
}