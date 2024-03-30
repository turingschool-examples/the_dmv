require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type,
              :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  #method to change plate type replace attr_accessor
  def update_plate_type(vehicle)
    if vehicle.antique?
      @plate_type = 'antique'
    elsif vehicle.electric_vehicle?
      @plate_type = 'electric'
    else
      @plate_type = 'regular'
    end
  end

  #method to change registration date
  def update_registration_date
    @registration_date = Date.today
  end
  
end
