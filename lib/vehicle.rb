# Date is a Ruby class that represents a date.
# It has a method called today that returns today's date.
require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type
  # :registration_date must be in attr_accessor because it is being
  # changed in the register_vehicle method in the Facility class.
  attr_accessor :registration_date

  # Creates a new Vehicle object
  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  # Determines if a vehicle is an anqtique.
  def antique?
    # Date.today.year is a Ruby method that returns the current year.
    # This checks if the current year minus the year of the vehicle
    # is greater than 25.
    Date.today.year - @year > 25
  end

  # Determines if a vehicle is an electric vehicle
  def electric_vehicle?
    @engine == :ev
  end

  # Determines the plate type of a vehicle
  def determine_plate_type
    @plate_type = if antique?
                    :antique
                  elsif electric_vehicle?
                    :ev
                  else
                    :regular
                  end
  end
end
