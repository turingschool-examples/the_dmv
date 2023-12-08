require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
  attr_accessor :registration_date,
                :plate 

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil 
    @plate = nil 
  end

  def plate_type
    if antique? 
      @plate = :antique
    elsif electric_vehicle?
      @plate = :ev
    else 
      @plate = :regular
    end 
  end 

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end
end
