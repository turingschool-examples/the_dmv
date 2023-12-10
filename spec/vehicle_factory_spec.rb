require 'spec_helper'

RSpec.describe VehicleFactory do
    describe '#initialize' do
        it 'can initialize' do
            factory = VehicleFactory.new

            expect(factory).to be_a(VehicleFactory)
        end
    end

    describe '#create_vehicles' do
        it 'can create vehicles from external data' do
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            
            expect(factory.create_vehicles(wa_ev_registrations).first).to be_a(Vehicle)
            expect(factory.create_vehicles(wa_ev_registrations).last).to be_a(Vehicle)
            expect(factory.create_vehicles(wa_ev_registrations)).to be_a(Array)
        end
    end

    describe '#create_vehicles_ny' do
        it 'can create vehicles from NY external data' do
            factory = VehicleFactory.new
            ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations 
            
            expect(factory.create_vehicles_ny(ny_vehicle_registrations).first).to be_a(Vehicle)
            expect(factory.create_vehicles_ny(ny_vehicle_registrations).last).to be_a(Vehicle)
            expect(factory.create_vehicles_ny(ny_vehicle_registrations)).to be_a(Array)
        end
    end
end