# typed: ignore

require "rspec"
require "./spec/spec_helper"
require "./lib/vehicle_factory"

RSpec.describe VehicleFactory do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @vehicle_factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @ny_registrations = DmvDataService.new.ny_vehicle_registrations
  end

  it "exists" do
    expect(@vehicle_factory).to be_an_instance_of(VehicleFactory)
  end

  describe "#create vehicle array" do
    it "can create vehicle info" do
      vehicle = @wa_ev_registrations[0]
      info = @vehicle_factory.create_vehicle_hash(vehicle, :ev)
      [
        info[:engine],
        info[:make],
        info[:model],
        info[:registration_date],
        info[:vin],
        info[:year]
      ].each { |specification| expect(specification.nil?).to eq(false) }
    end
    it "can create an array of vehicles" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      expect(@vehicle_factory.vehicles[0]).to be_an_instance_of(Vehicle)
    end
  end

  describe "#vehicle registration data" do # rubocop:disable Metrics/BlockLength
    it "initializes with empty data set" do
      @vehicle_factory.vehicle_data.each_value do |value|
        expect(value).to eq({})
      end
    end
    it "creates hashes with consolidated vehicle data" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      vehicle = @vehicle_factory.vehicles[0]
      data = @vehicle_factory.retrieve_vehicle_data(vehicle)
      data.each_value do |datum|
        expect(datum.nil?).to eq(false)
      end
    end
    it "counts the number of vehicles for each make" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      @vehicle_factory.retrieve_vehicle_makes_and_models
      makes = {}
      @vehicle_factory.vehicle_data[:makes].each do |make, make_data|
        makes[make] = 0
        make_data.each_value do |model|
          makes[make] += model[:total]
        end
      end
      total_vehicles = 0
      makes.each_value do |vehicle_count|
        total_vehicles += vehicle_count
      end
      expect(total_vehicles).to eq(@vehicle_factory.vehicles.count)
    end
    it "counts the number of vehicles for each model" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      @vehicle_factory.retrieve_vehicle_makes_and_models
      makes = {}
      @vehicle_factory.vehicle_data[:makes].each do |make, make_data|
        makes[make] = {}
        make_data.each do |model, model_data|
          makes[make][model] = model_data[:total]
        end
      end
      total_vehicles = 0
      makes.each_value do |make|
        make.each_value do |model|
          total_vehicles += model
        end
      end
      expect(total_vehicles).to eq(@vehicle_factory.vehicles.count)
    end
    it "counts the number of vehicles for each model year (must be nonzero)" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      makes_and_models_data = @vehicle_factory.retrieve_vehicle_makes_and_models
      makes_and_models_data.each_value do |make|
        make.each_value do |model|
          total_model_quantity = 0
          model.except(:total).each_value do |model_year_quantity|
            expect(model_year_quantity > 0).to eq(true)
            total_model_quantity += model_year_quantity
          end
          expect(total_model_quantity).to eq(model[:total])
        end
      end
    end
    it "counts the number of cars in each county (must be nonzero)" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      @vehicle_factory.retrieve_vehicle_counties
      total_vehicles = 0
      total_counties = 0
      @vehicle_factory.vehicle_data[:counties].each_value do |num_in_county|
        total_vehicles += num_in_county
        expect(num_in_county > 0).to eq(true)
        total_counties += 1
      end
      expect(total_counties > 0).to eq(true)
      expect(total_vehicles).to eq(@vehicle_factory.vehicles.count)
    end
    it "finds the county with the most vehicles" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      @vehicle_factory.retrieve_vehicle_counties
      top_county = {
        county: nil,
        quantity: 0
      }
      @vehicle_factory.vehicle_data[:counties].each do
        |county, registered_vehicles|
        if registered_vehicles > top_county[:quantity]
          top_county[:county] = county
          top_county[:quantity] = registered_vehicles
        end
      end
      expect(top_county[:county]).to be_an_instance_of(String)
      expect(top_county[:quantity] > 0).to eq(true)
    end
    it "consolidates all vehicle data into a single hash" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      @vehicle_factory.consolidate_all_vehicle_data
      @vehicle_factory.vehicle_data.each_value do |hash|
        expect(hash.keys.empty?).to eq(false)
      end
    end
    it "creates a json file with all vehicle data" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      @vehicle_factory.consolidate_all_vehicle_data
      @vehicle_factory.write_vehicle_data_to_text_file
      expect(File.size?("vehicle_data.json").nil?).to eq(false)
    end
  end

  describe "#NY registration data" do
    it "can pull registration data from NY DMV" do
      @vehicle_factory.create_vehicles(@ny_registrations, :regular)
      @vehicle_factory.vehicles.each do |vehicle|
        expect(vehicle).to be_an_instance_of(Vehicle)
        expect(vehicle.vin.nil?).to eq(false)
        expect(vehicle.year.nil?).to eq(false)
        expect(vehicle.make.nil?).to eq(false)
        expect(vehicle.model.nil?).to eq(false)
        expect(vehicle.engine.nil?).to eq(false)
        expect(vehicle.registration_date.nil?).to eq(false)
        expect(vehicle.county.nil?).to eq(false)
      end
    end
  end
end
