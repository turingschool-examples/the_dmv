require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @vehicle_factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
    
    describe '#initialize' do
        it 'can initialize' do
        expect(@vehicle_factory).to be_an_instance_of(VehicleFactory)
        end
    end
    
    describe '#create_vehicles' do
        it 'can return array of vehicle objects' do
        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)

        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations).first).to be_an_instance_of(Vehicle)
        end
    end
    
    end