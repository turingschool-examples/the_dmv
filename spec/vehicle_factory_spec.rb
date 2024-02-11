# typed: ignore

require "rspec"
require "./spec/spec_helper"
require "./lib/vehicle_factory"

RSpec.describe VehicleFactory do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @vehicle_factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
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
    it "initializes with nil empty data set" do
      @vehicle_factory.vehicle_data.each_value do |value|
        expect(value).to eq(nil)
      end
    end
    it "counts the number of vehicles for each make" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      makes_and_models_data = @vehicle_factory.retrieve_vehicle_makes_and_models
      total_make_count = 0
      makes_and_models_data.each_value do |make_data|
        total_make_count += make_data[:total]
      end
      expect(total_make_count).to eq(@vehicle_factory.vehicles.count)
    end
    it "counts the number of vehicles for each model" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      makes_and_models_data = @vehicle_factory.retrieve_vehicle_makes_and_models
      total_model_count = 0
      makes_and_models_data.each_value do |make_data|
        make_data.except(:total).each_value do |model|
          total_model_count += model[:total]
        end
      end
      expect(total_model_count).to eq(@vehicle_factory.vehicles.count)
    end
    it "counts the number of vehicles for each model year" do
      @vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      makes_and_models_data = @vehicle_factory.retrieve_vehicle_makes_and_models
      makes_and_models_data.each_value do |model|
        total_in_model_year = 0
        model.except(:total).each_value do |model_year_quantity|
          total_in_model_year += model_year_quantity
          expect(model_year_quantity > 0).to eq(true)
        end
        expect(total_in_model_year).to eq(model[:total])
      end
    end
  end
end
