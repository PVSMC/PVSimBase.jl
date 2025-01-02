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

# constructor accepting keywords
function Location(; latitude, longitude, altitude = 0.0, timezone = TimeZone("UTC"))
    return Location(latitude, longitude, altitude, timezone)
end

function Location(
        latitude::F,
        longitude::F,
        altitude::F,
        timezone::TimeZone
) where {F <: Real}
    return Location(
        Quantity(latitude, SymbolicDimensions, deg = 1),
        Quantity(longitude, SymbolicDimensions, deg = 1),
        Quantity(altitude, SymbolicDimensions, m = 1),
        timezone
    )
end
# Handle default for Quantities
function Location(
        latitude::Q,
        longitude::Q,
        altitude::F,
        timezone::TimeZone
) where {F <: Real, Q <: Quantity}
    return Location(
        latitude, longitude, Quantity(altitude, SymbolicDimensions, m = 1), timezone)
end

end
