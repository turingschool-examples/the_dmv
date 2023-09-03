require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it 'exists' do
      factory = VehicleFactory.new
      
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
    
    it 'can access WA EV registrations and create a vehicle' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      factory_vehicles = factory.create_vehicles(wa_ev_registrations)
      expect(factory_vehicles).to be_an_instance_of(Array)
      expect(factory_vehicles.first).to be_an_instance_of(Vehicle)
    end
  end
end
