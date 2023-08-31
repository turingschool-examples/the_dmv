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
    @registration_date = vehicle_details[:registration_date]
    @plate_type = vehicle_details[:plate_type]
    @registered = false
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date
    # Date.today
  end

  def plate_type
    if @year <= Date.today.year.to_i - 25
      @plate_type = :antique
    elsif @engine == :ev
      @plate_type = :ev
    else 
      @plate_type = :regular
    end
  end
end
