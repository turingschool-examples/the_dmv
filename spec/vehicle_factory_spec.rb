require 'spec_helper'

RSpec.describe VehicleFactory do
    it 'returns a vehicle object' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        
        expect(factory.create_vehicles(wa_ev_registrations)).to all(be_an_instance_of(Vehicle))
    end
end