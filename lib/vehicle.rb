require 'date'

class Vehicle
  attr_accessor :registration_date,
                :plate_type
  attr_reader   :vin,
                :year,
                :make,
                :model,
                :engine
              

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = plate_type
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def vehicle_type 
    if Date.today.year - @year > 25 
      @plate_type = :antique 
    elsif @engine == :ev 
      @plate_type = :ev 
    else 
      @plate_type = :regular
    end 
  end 
end 