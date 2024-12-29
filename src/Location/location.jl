module GeoLocation

using TimeZones
using DynamicQuantities
using Unitful: Unitful
using DocStringExtensions

export Location

"""
$(TYPEDEF)
"""
struct Location
    "Latitude in degrees"
    latitude::Quantity
    "Longitude in degrees"
    longitude::Quantity
    "Altitude in meters"
    altitude::Quantity
    "Timezone of the location"
    timezone::TimeZone
end

# constructor accepting Float64 inputs
function Location(
    latitude::Float64,
    longitude::Float64;
    altitude::Float64 = 0.0,
    timezone::TimeZone = TimeZone("UTC"),
)
    return Location(
        Quantity(latitude, deg = 1),
        Quantity(longitude, deg = 1),
        Quantity(altitude, m = 1),
        timezone,
    )
end

# constructor accepting Quantity inputs
function Location(
    latitude::Quantity,
    longitude::Quantity;
    altitude::Quantity = Quantity(0.0, m = 1),
    timezone::TimeZone = TimeZone("UTC"),
)
    return Location(latitude, longitude, altitude, timezone)
end

end