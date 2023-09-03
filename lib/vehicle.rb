require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine, 
              :registration_date, 
              :plate_type
  attr_writer :registration_date, 
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

  def parse_vin(data)
    if data[:vin]
      data[:vin]
    elsif data[:vin_1_10]
      data[:vin_1_10]
    end
  end
  def parse_year(data)
    if data[:year]
      data[:year]
    elsif data[:model_year]
      data[:model_year]
    end
  end
  def parse_engine(data)
    if data[:engine]
      data[:engine]
    else
    :ev
  end
end
  
end
