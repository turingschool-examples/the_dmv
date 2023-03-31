require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "initializes" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      factory.create_vehicles(wa_ev_registrations)
      
      expect(factory.vehicles).to be_an_instance_of(Array)
      expect(factory.vehicles.first).to be_an_instance_of(Vehicle)
    end
  end
end