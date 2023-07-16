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
    if antique? == true
      @registration_date = Date.today.year
      @plate_type = :antique
    elsif @engine != :ev
      @registration_date = Date.today.year
      @plate_type = :regular
    else
      @registration_date = Date.today.year
      @plate_type = :ev
    end
    return @plate_type
    return @registration_date
  end
end
