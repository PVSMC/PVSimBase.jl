using PVSimBase.GeoLocation: Location
using TimeZones: TimeZone
using DynamicQuantities

@testset "Location" begin
    latitudes = [37.7749, Quantity(37.7749, deg = 1), Quantity(37.7749, deg = 1)]
    longitudes = [-122.4194, Quantity(-122.4194, deg = 1), Quantity(-122.4194, deg = 1)]
    altitudes = [0.0, Quantity(0.0, m = 1), Quantity(10.0, m = 1)]
    timezones = [TimeZone("UTC"), TimeZone("UTC"), TimeZone("America/Los_Angeles")]
    for (latitude, longitude, altitude, timezone) in
        zip(latitudes, longitudes, altitudes, timezones)
        location = Location(latitude, longitude, altitude = altitude, timezone = timezone)
        @test location.latitude == Quantity(37.7749, deg = 1)
        @test location.longitude == Quantity(-122.4194, deg = 1)
        @test location.altitude == Quantity(altitude, m = 1)
        @test location.timezone == timezone
    end

    # Test constructor with Float64 inputs
    location1 = Location(37.7749, -122.4194)
    @test location1.latitude == Quantity(37.7749, deg = 1)
    @test location1.longitude == Quantity(-122.4194, deg = 1)
    @test location1.altitude == Quantity(0.0, m = 1)
    @test location1.timezone == TimeZone("UTC")

    # Test constructor with Quantity inputs
    location2 = Location(Quantity(37.7749, deg = 1), Quantity(-122.4194, deg = 1))
    @test location2.latitude == Quantity(37.7749, deg = 1)
    @test location2.longitude == Quantity(-122.4194, deg = 1)
    @test location2.altitude == Quantity(0.0, m = 1)
    @test location2.timezone == TimeZone("UTC")
end