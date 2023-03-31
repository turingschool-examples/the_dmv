require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "initializes" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      vehicle_array = factory.create_vehicles(wa_ev_registrations)
      expect(vehicle_array).to be_an_instance_of(Array)
      expect(vehicle_array.first).to be_an_instance_of(Vehicle)
    end
  end
end