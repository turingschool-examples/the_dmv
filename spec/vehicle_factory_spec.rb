require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    it 'can initialize' do
        expect(factory = VehicleFactory.new).to be_an_instance_of(VehicleFactory)
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        vehicles = factory.create_vehicles(wa_ev_registrations)
        expect(vehicles.length).to be_a(Integer)
        expect(vehicles[0].engine).to eq("ev")
        expect(vehicles.first).to be_an_instance_of(Vehicle)
        
    end
end