require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @engine = vehicle_details[:engine]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @plate_type = vehicle_details[:plate_type]
    @registration_date = vehicle_details[:registration_date]
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def set_registration_date(time)
    @registration_date = time
  end

  def set_plate_type
    if engine == :ev
      @plate_type = :ev
    elsif year <= 1998
      @plate_type = :antique
    else 
      @plate_type = :regular
    end
  end 
end
