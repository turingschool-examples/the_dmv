require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "exists" do
      factory = VehicleFactory.new

      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe "#create_vehicles" do
    it "returns new vehicles from WAs external API data in an array" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      # this works in this specific case, but is not consistent as APIs can change
      expect(factory.create_vehicles(wa_ev_registrations).first.vin).to eq("1G1RC6S55J")
      expect(factory.create_vehicles(wa_ev_registrations).last.vin).to eq("JN1AZ0CP7B")

      expect(factory.create_vehicles(wa_ev_registrations)).to_not be_empty
      expect(factory.create_vehicles(wa_ev_registrations).first).to be_a Vehicle
    end
  end

  describe "#detail_builder" do
    it "builds a hash of vehicle details" do
      factory = VehicleFactory.new
      first_wa_ev_registrations = DmvDataService.new.wa_ev_registrations.first

      details = factory.detail_builder(first_wa_ev_registrations)
      expect(details).to be_a Hash
      expect(details.key?(:vin)).to be true
      expect(details.key?(:year)).to be true
      expect(details.key?(:make)).to be true
      expect(details.key?(:model)).to be true
      expect(details.key?(:engine)).to be true
    end
  end
end