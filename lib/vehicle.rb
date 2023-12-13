require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine, 
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = plate_type
    @registration_date = registration_date
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date
    @registration_date = Date.today
  end

  def plate_type
    if antique?
      @plate_type = :antique
    elsif electric_vehicle? 
      @plate_type = :ev 
    else
      @plate_type = :regular
    end
  end

end
