require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new 
    end
    
    describe '#initialize' do
      it 'can initialize' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
      end
    end

    describe '#create_vehicles' do
      it 'can create vehicles' do
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory.create_vehicles(wa_ev_registrations)
      
        expected = Vehicle.new(
            vin: wa_ev_registrations.first[:vin_1_10],
            year: wa_ev_registrations.first[:model_year],
            make: wa_ev_registrations.first[:make],
            model: wa_ev_registrations.first[:model],
            engine: :ev)

        expect(@factory.vehicle_list).to all be_a Vehicle
        expect(@factory.vehicle_list).to be_an Array
        expect(@factory.vehicle_list.first.vin).to eq(expected.vin) #CHEVROLET
        expect(@factory.vehicle_list.first.year).to eq(expected.year) #Volt
        expect(@factory.vehicle_list.first.make).to eq(expected.make) #1G1RC6S55J
        expect(@factory.vehicle_list.first.model).to eq(expected.model) #2018
        expect(@factory.vehicle_list.first.engine).to eq(expected.engine) #:ev
        expect(@factory.vehicle_list.first.plate_type).to be nil
        expect(@factory.vehicle_list.first.registration_date).to be nil
      end
    end

    describe 'EV Registrations' do
      it 'can find the most popular make/model registered' do
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory.create_vehicles(wa_ev_registrations)

        expect(@factory.most_popular_vehicle).to eq("NISSAN Leaf")
      end

      it 'can count the number of registered vehicles each model year' do
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory.create_vehicles(wa_ev_registrations)

        expect(@factory.count_registered_vehicle("2020")).to eq(66)
      end

      it 'county with most registered vehicles' do
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory.create_vehicles(wa_ev_registrations)
        
        expect(@factory.county_most_vehicles).to eq("King")
      end
    end
end

