require "./spec/spec_helper"

# Documentation for VehicleFactory class
class VehicleFactory
  attr_reader :vehicles, :vehicle_data

  def initialize
    @vehicles = []
    @vehicle_data = {
      makes: {},
      counties: {}
    }
    @vehicle_data.default = 0
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

  def retrieve_vehicle_data(vehicle)
    {
      make: vehicle.make,
      model: vehicle.model,
      year: vehicle.year
    }
  end

  def retrieve_vehicle_makes_and_models # rubocop:disable Metrics/AbcSize
    @vehicles.each do |vehicle|
      if @vehicle_data[vehicle.make].zero?
        @vehicle_data[vehicle.make] =
          { vehicle.make => { vehicle.model => { vehicle.year.to_s => 1 } } }
      elsif @vehicle_data[vehicle.make][vehicle.model].zero?
        @vehicle_data[vehicle.make][vehicle.model] = { vehicle.year.to_s => 1 }
      else
        @vehicle_data[vehicle.make][vehicle.model][vehicle.year.to_s] += 1
      end
    end
  end

  def retrieve_vehicle_model_years; end

  def retrieve_vehicle_counties; end

  def consolidate_all_vehicle_data; end

  def write_vehicle_data_to_text_file; end
end
