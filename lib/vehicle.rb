require 'date'

class Vehicle
  attr_accessor :vin,
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
      @plate_type = :antique
    elsif @engine != :ev
      @plate_type = :regular
    else
      @plate_type = :ev
    end
  end

end
