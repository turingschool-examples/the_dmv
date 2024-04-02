require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :county,
              :plate_type,
              :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @county = vehicle_details[:county]
    @plate_type = nil
    registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def update_plate_type(vehicle)
    if vehicle.antique?
      @plate_type = 'antique'
    elsif vehicle.electric_vehicle?
      @plate_type = 'electric'
    else
      @plate_type = 'regular'
    end
  end

  def update_registration_date
    @registration_date = Date.today
  end
  
end
