require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
        binding.pry
    end

    it 'loads data for WA EV registrations' do
        expect(@wa_ev_registrations).to be_an_instance_of(Array)
    end

    it 'loads data for NY vehicle registrations' do
        expect(@ny_vehicle_registrations).to be_an_instance_of(Array)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create_vehicles' do
        describe 'creating WA EV vehicles' do
            it 'can use data to create new instances of Vehicle object' do
                expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
                expect(@factory.create_vehicles(@wa_ev_registrations).size).to be_an(Integer)
                expect(@factory.create_vehicles(@wa_ev_registrations).first).to be_an_instance_of(Vehicle)
                expect(@factory.create_vehicles(@wa_ev_registrations).last).to be_an_instance_of(Vehicle)
            end

            it 'has correct data for first Vehicle instance created' do
                first_vehicle = @factory.create_vehicles(@wa_ev_registrations).first
                expect(first_vehicle.engine).to eq(:ev)
                expect(first_vehicle.make).to eq('TESLA')
                expect(first_vehicle.model).to eq('Model Y')
                expect(first_vehicle.plate_type).to eq(:ev)
                expect(first_vehicle.registration_date).to eq("2023-06-28T00:00:00.000")
                expect(first_vehicle.vin).to eq("7SAYGDEE0P")
                expect(first_vehicle.year).to eq(2023)
            end
        end

        describe 'creating NY vehicles' do
            it 'can use data to create new instances of Vehicle object' do
                expect(@factory.create_vehicles(@ny_vehicle_registrations)).to be_an_instance_of(Array)
                expect(@factory.create_vehicles(@ny_vehicle_registrations).size).to be_an(Integer)
                expect(@factory.create_vehicles(@ny_vehicle_registrations).first).to be_an_instance_of(Vehicle)
                expect(@factory.create_vehicles(@ny_vehicle_registrations).last).to be_an_instance_of(Vehicle)
            end
        end
    end
end