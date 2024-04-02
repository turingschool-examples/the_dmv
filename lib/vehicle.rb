require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registered,
              :plate_type,
              :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registered = false
    @registration_date = nil
  end

  def antique?
    antique = Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if @engine == :ev
      @plate_type = :ev
    elsif antique?
      @plate_type = :antique
    else 
      @plate_type = :regular
    end
  end
  
  def assign_date
    @registration_date = Date.today.year
  end
end
