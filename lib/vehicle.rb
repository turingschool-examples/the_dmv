require './spec/spec_helper'
require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
        
  attr_accessor :registration_date, :plate_type

  def initialize(vehicle_details)
    @vin = parse_vin(vehicle_details)
    @year = parse_year(vehicle_details)
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = parse_engine(vehicle_details)
    @registration_date = nil
    @plate_type = nil
  end
  
  def parse_vin(vehicle_details)
    vehicle_details[:state_of_residence] == "WA" ? @vin = vehicle_details[:vin_1_10] : @vin = vehicle_details[:vin]
  end

  def parse_year(vehicle_details)
    vehicle_details[:state_of_residence] == "WA" ? @year = vehicle_details[:model_year] : @year = vehicle_details[:year]
  end

  def parse_engine(vehicle_details)
    if vehicle_details[:state_of_residence] == "WA"
      @engine = :ev
    else
      @engine == antique? ? :antique : electric_vehicle? ? :ev : :regular
    end
  end

  def antique?
    Date.today.year - @year.to_i > 25
  end

  def electric_vehicle?
    @engine == :ev
  end
end