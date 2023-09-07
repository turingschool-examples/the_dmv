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
    @model = parse_model(vehicle_details)
    @engine = parse_engine(vehicle_details)
    @registration_date = nil
    @plate_type = parse_plate
    @vehicle_type = parse_type(vehicle_details)
    @body_type = parse_model(vehicle_details)
  end
  def parse_model(vehicle_details)
    if vehicle_details[:state] == "WA" || vehicle_details[:state] == "CO"
      @model = vehicle_details[:model]
    elsif vehicle_details[:state] == "NY" || vehicle_details[:state] == "PA" ||
      vehicle_details[:state] == "MD"
        @body_type = vehicle_details[:body_type]
    elsif vehicle_details[:model]
      @model = vehicle_details[:model]
    else
      @model = nil
    end
  end
  def parse_vin(vehicle_details)
    vehicle_details[:state_of_residence] == "WA" ? @vin = vehicle_details[:vin_1_10] : @vin = vehicle_details[:vin]
  end

  def parse_year(vehicle_details)
    if vehicle_details[:state_of_residence] == "WA" || vehicle_details[:state] == "NY" ||
      vehicle_details[:state] == "PA" || vehicle_details[:state] == "MD"
        @year = vehicle_details[:model_year]
    else
      @year = vehicle_details[:year]
    end
  end

  def parse_engine(vehicle_details)
    if vehicle_details[:state_of_residence] == "WA"
      @engine = :ev
    elsif vehicle_details[:state] == "NY" || vehicle_details[:state] == "PA" ||
      vehicle_details[:state] == "MD"
        @engine = vehicle_details[:fuel_type]
    else
      @engine = vehicle_details[:engine]
    end
  end

  def parse_plate
    @plate_type = antique? ? :antique : electric_vehicle? ? :ev : :regular
  end

  def parse_type(vehicle_details)
    if vehicle_details[:state] == "NY" || vehicle_details[:state] == "PA"
      @vehicle_type = vehicle_details[:record_type]
    end
  end

  def antique?
    Date.today.year - @year.to_i > 25
  end

  def electric_vehicle?
    @engine == :ev
  end
end