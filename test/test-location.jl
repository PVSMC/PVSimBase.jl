using PVSimBase.GeoLocation: Location
using TimeZones: TimeZone
using DynamicQuantities

@testset "Location" begin
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
