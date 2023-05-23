require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine

  attr_accessor :registration_date,
                :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = parse_year(vehicle_details)
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
  
  def parse_year(vehicle_details)
    if vehicle_details[:year]
      vehicle_details[:year]
    elsif vehicle_details[:model_year]
      vehicle_details[:model_year]
    end
  end
end
