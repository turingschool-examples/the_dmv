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

      expect(factory.create_vehicles(wa_ev_registrations).first.vin).to eq("1G1RC6S55J")
      expect(factory.create_vehicles(wa_ev_registrations).last.vin).to eq("JN1AZ0CP7B")
    end
  end
end