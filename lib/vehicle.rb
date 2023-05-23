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
    @vin = parse_vin(vehicle_details)
    @year = parse_year(vehicle_details)
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = parse_engine(vehicle_details)
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

  def parse_engine(vehicle_details)
    if vehicle_details[:engine]
      vehicle_details[:engine]
      elsif vehicle_details[:electric_vehicle_type]
      vehicle_details[:electric_vehicle_type] = [:ev]
    end
  end

  def parse_vin(vehicle_details)
    if vehicle_details[:vin]
      vehicle_details[:vin]
      elsif vehicle_details[:vin_1_10]
        vehicle_details[:vin_1_10]
    end
  end
end
