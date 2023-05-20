require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :register,
              :plate_type,
              :registration_date
  attr_accessor :is_registered

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @is_registered = false
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def register
    @is_registered = true
    @registration_date = Date.today
    
    if self.antique? == true
      plate_type = :antique
    elsif @engine == :ev
      plate_type = :ev
    else
      plate_type = :regular
    end
  end
end
