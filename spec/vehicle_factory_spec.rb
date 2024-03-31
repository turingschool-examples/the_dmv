require 'spec_helper'

describe VehicleFactory do
    before do
        @factory = VehicleFactory.new
    end

    it 'is a vehicle factory' do
        expect(@factory).to be_a(VehicleFactory)
    end

    it 'creates vehicle objects using api data' do
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        vehicles = @factory.create_vehicles(wa_ev_registrations)
        vehicle_1 = vehicles.first
binding.pry
        expect(vehicles).to be_an(Array)
        expect(vehicle_1.model).to eq("Model Y")
        expect(vehicle_1.make).to eq("TESLA")
        expect(vehicle_1.vin).to eq("7SAYGDEE0P")
        expect(vehicle_1.year).to eq("2023")
    end
end
