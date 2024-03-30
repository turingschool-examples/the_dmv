require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    it 'loads data for WA EV registrations' do
        expect(@wa_ev_registrations).to be_an_instance_of(Array)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end

        it 'has no vehicles to start' do
            expect(@factory.vehicles).to be_empty
        end
    end

    describe '#create_vehicles' do
        it 'can use data to create new instances of Vehicle object' do
            expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
            expect(@factory.create_vehicles(@wa_ev_registrations).size).to be_an(Integer)
            expect(@factory.create_vehicles(@wa_ev_registrations).first).to be_an_instance_of(Vehicle)
            expect(@factory.create_vehicles(@wa_ev_registrations).last).to be_an_instance_of(Vehicle)
        end
    end
end