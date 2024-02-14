require "./spec/spec_helper"

# The Vehicle class is a proxy for retrieving information about a vehicle
# registered in a given state. The information available in this class is
# the VIN, model year, make, model, engine type, and county that the vehicle
# was registered in.
#
# Syntax:
#
# vehicle = Vehicle.new({
#   vin: "1jfk2l4",
#   year: "1990",
#   make: "TESLA",
#   model: "Model S",
#   engine: :ev,
#   registration_date: "05-02-2013",
#   county: "Park"
# })
#
# Methods:
#
# vehicle.antique?
# vehicle.electric_vehicle?
class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :county

  attr_accessor :registration_date, :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = vehicle_details[:registration_date]
    @plate_type = vehicle_details[:plate_type]
    @county = vehicle_details[:county]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end
end
