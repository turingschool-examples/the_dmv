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
    @registration_date = registration_date
    @plate_type = plate_type
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registered
    @registration_date = Date.today
    #assign value to plate_type depending on conditions
    if antique?
      @plate_type = :antique
    elsif @engine == :ev
      @plate_type = :ev
    else
      @plate_type = :regular
    end
  end

end
