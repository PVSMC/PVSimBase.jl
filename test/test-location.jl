using PVSimBase.GeoLocation: Location
using TimeZones: TimeZone
using DynamicQuantities

@testset "Location" begin
    test_cases = [
        (
            test_name = "Constructor - Float64",
            latitude = 37.7749,
            longitude = -122.4194,
            altitude = 0.0,
            timezone = TimeZone("UTC"),
        ),
        (
            test_name = "Constructor - Quantity",
            latitude = Quantity(37.7749, deg = 1),
            longitude = Quantity(-122.4194, deg = 1),
            altitude = Quantity(0.0, m = 1),
            timezone = TimeZone("UTC"),
        ),
        (
            test_name = "Constructor - All Parameters",
            latitude = 37.7749,
            longitude = -122.4194,
            altitude = 10.0,
            timezone = TimeZone("America/Los_Angeles"),
        ),
    ]
    for (i, test_case) in enumerate(test_cases)
        @testset "Test Case $i: $(test_case.test_name)" begin
            loc = Location(
                latitude = test_case.latitude,
                longitude = test_case.longitude,
                altitude = test_case.altitude,
                timezone = test_case.timezone,
            )
            @test loc.latitude == Quantity(test_case.latitude, deg = 1)
            @test loc.longitude == Quantity(test_case.longitude, deg = 1)
            @test loc.altitude == Quantity(test_case.altitude, m = 1)
            @test loc.timezone == test_case.timezone
        end
    end
end