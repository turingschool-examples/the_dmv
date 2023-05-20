require 'spec_helper'

RSpec.describe VehicleFactory do 
    describe '#initialize'do
        
        it 'exist' do 
            factory = VehicleFactory.new

            expect(factory).to be_a(VehicleFactory)
        end

        it 'holds an array of vehicles' do
            factory = VehicleFactory.new

            expect(factory.vehicles).to eq([])
        end
    end

    describe '#create_vehicles' do

        it 'can add vehicles to @vehicle from an array of ' do
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations

            factory.create_vehicles(wa_ev_registrations)

            expect(factory.vehicles).to be_a([Vehicle])
        end
    end
end