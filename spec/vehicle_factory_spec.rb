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
      vehicle_factory = @vehicle_factory
      vehicle_factory.create_vehicles(@wa_ev_registrations, :ev)
      expect(vehicle_factory.vehicles[0]).to be_an_instance_of(Vehicle)
    end
  end
end
