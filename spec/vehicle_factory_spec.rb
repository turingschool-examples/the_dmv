require 'spec_helper'

RSpec.describe VehicleFactory do 
    describe '#initialize' do 
        it 'can initialize' do 
            factory = VehicleFactory.new

            expect(factory).to be_an_instance_of(VehicleFactory)
        end 
    end 

    describe '#create_vehicle(registartions)' do 
        it 'vehicle being created is a object of vehicle' do 
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            
            expect(factory.create_vehicles(wa_ev_registrations).first).to be_an_instance_of(Vehicle)
        end 

        it 'has an ev engine' do 
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations

            expect(factory.create_vehicles(wa_ev_registrations).first.engine).to eq(:ev)
        end 

        it 'has a vin number' do 
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations

            expect(factory.create_vehicles(wa_ev_registrations).first.vin).not_to be(nil)
        end 
    end 
end 