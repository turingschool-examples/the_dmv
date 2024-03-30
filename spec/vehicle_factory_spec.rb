require 'spec_helper'

describe VehicleFactory do
    it 'is a vehicle factory' do
        factory = VehicleFactory.new
        expect(factory).to be_a(VehicleFactory)
    end

    it 'creates vehicle objects using api data' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        factory.create_vehicles(wa_ev_registrations)
    end
end
