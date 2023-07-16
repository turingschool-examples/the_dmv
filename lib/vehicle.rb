require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date, 
              :plate_type,
              :registered

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
    @registered = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if antique? == true
      @registered = true
      @plate_type = :antique
    elsif @engine != :ev
      @registered = true
      @plate_type = :regular
    else
      @registered = true
      @plate_type = :ev
    end
  end

  def registration_date
    if @registered == true
      Date.today.year
    else
      nil
    end
  end
end
