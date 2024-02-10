require "./spec/spec_helper"

# Documentation for VehicleFactory class
class VehicleFactory
  attr_reader :vehicles, :vehicle_data

  def initialize
    @vehicles = []
    @vehicle_data = {
      makes: nil,
      models: nil,
      model_years: nil,
      counties: nil
    }
  end

  def create_vehicle_hash(vehicle_info, engine_type)
    {
      vin: vehicle_info[:vin_1_10], # rubocop:disable Naming/VariableNumber
      year: vehicle_info[:model_year],
      make: vehicle_info[:make],
      model: vehicle_info[:model],
      engine: engine_type,
      registration_date: vehicle_info[:transaction_date],
      plate_type: nil
    }
  end

  def create_vehicles(vehicles, engine_type)
    vehicles.each do |vehicle|
      new_vehicle = Vehicle.new(create_vehicle_hash(vehicle, engine_type))
      @vehicles.push(new_vehicle)
    end
  end

  def retrieve_vehicle_datum(vehicle); end

  def retrieve_vehicle_makes_and_models; end

  def retrieve_vehicle_model_years; end

  def retrieve_vehicle_counties; end

  def consolidate_vehicle_data; end
end
