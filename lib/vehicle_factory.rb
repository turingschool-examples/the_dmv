require "./spec/spec_helper"

# The VehicleFactory class is the most important class for generating usable
# data on vehicles registered in the states of CO, NY, and MO. It contains
# an array of Vehicle objects containing all relevant data about that vehicle,
# and is capable of generating a .json file displaying every make, model, and
# model year for the past 1000 registrated vehicles in that state.
#
# Syntax:
#
# vehicle_factory = VehicleFactory.new
#
# Methods:
#
# vehicle_factory.consolidate_all_vehicle_data
# vehicle_factory.write_vehicle_data_to_text_file
class VehicleFactory
  attr_reader :vehicles, :vehicle_data

  def initialize
    @vehicles = []
    @vehicle_data = {
      makes: {},
      counties: {}
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
      plate_type: nil,
      county: vehicle_info[:county]
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

  # rubocop:disable Layout/LineLength,Metrics/MethodLength,Metrics/AbcSize
  def retrieve_vehicle_makes_and_models
    @vehicles.each do |vehicle|
      if @vehicle_data[:makes][vehicle.make].nil?
        @vehicle_data[:makes][vehicle.make] = { vehicle.model => { vehicle.year.to_s => 1 } }
      elsif @vehicle_data[:makes][vehicle.make][vehicle.model].nil?
        @vehicle_data[:makes][vehicle.make][vehicle.model] = { vehicle.year.to_s => 1 }
      elsif @vehicle_data[:makes][vehicle.make][vehicle.model][vehicle.year.to_s].nil?
        @vehicle_data[:makes][vehicle.make][vehicle.model][vehicle.year.to_s] = 1
      else
        @vehicle_data[:makes][vehicle.make][vehicle.model][vehicle.year.to_s] += 1
      end
    end
    add_vehicle_data_totals
  end
  # rubocop:enable Layout/LineLength,Metrics/MethodLength,Metrics/AbcSize

  def add_vehicle_data_totals
    @vehicle_data[:makes].each_value do |make|
      make.each_value do |model|
        model[:total] = 0
        model.except(:total).each_value do |model_year|
          model[:total] += model_year
        end
      end
    end
  end

  def retrieve_vehicle_counties
    @vehicles.each do |vehicle|
      county = vehicle.county
      if @vehicle_data[:counties][county].nil?
        @vehicle_data[:counties][county] = 1
      else
        @vehicle_data[:counties][county] += 1
      end
    end
  end

  def consolidate_all_vehicle_data
    retrieve_vehicle_makes_and_models
    retrieve_vehicle_counties
  end

  def write_vehicle_data_to_json_file
    File.open("vehicle_data.json", "w") do |file|
      file.write(JSON.pretty_generate(vehicle_data))
    end
  end
end
