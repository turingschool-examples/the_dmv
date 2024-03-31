require 'date'
require 'pry'

class Vehicle
  attr_reader :vin,         # getter methods are read only
              :year,
              :make,
              :model,
              :engine,
              :set_date,
              :plate_type,
              :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def set_plate(plate)    # This is a helper method - not defined in IP
    @plate_type = plate   # Add new test for this
  end

  def set_date
    @registration_date = Date.today
  end

end
