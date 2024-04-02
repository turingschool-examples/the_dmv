require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
              :registration_date
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date
    @registration_date = Date.today
    return @registration_date
  end

  def register(facility)
    @registration_date = Date.today
    facility.add_service("Vehicle Registration")
  end
end

  def set_plate
    if vehicle.antique?
      vehicle.set_plate(:antique)
    elsif vehicle.electric_vehicle?
      vehicle.set_plate(:ev)
    else
      vehicle.set_plate(:regular)
    end
end
