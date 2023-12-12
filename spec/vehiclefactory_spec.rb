require 'spec_helper'

RSpec.describe VehicleFactory do
    before (:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    it 'returns a vehicle object' do
        expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Vehicle)
    end

    it 'provides vehicle data' do
        #test for vin, year, make, model, engine
        expect(@factory.create_vehicles(@wa_ev_registrations)).to be()
    end
end