require 'date'

class Vehicle
  attr_accessor :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
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

  def plate_type
    if Date.today.year - @year > 25
      @plate_type = :antique
      @plate_type
    elsif @engine == :ev
      @plate_type = :ev
      @plate_type
    else 
      @plate_type = :regular
      @plate_type
    end
  end
end
