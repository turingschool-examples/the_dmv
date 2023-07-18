require 'spec_helper'
require 'rspec'
require './lib/dmv_data_service'
require './lib/vehicle'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations 
    end
    
    describe '#initialize' do
      it 'can initialize' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
      end
    end

    describe '#create_vehicles' do
      it 'can create vehicles' do
        @factory.create_vehicles(wa_ev_registrations)
        expected = Vehicle.new(
            vin: wa_ev_registrations.first[:vin_1_10],
            year: wa_ev_registrations.first[:model_year],
            make: wa_ev_registrations.first[:make],
            model: wa_ev_registrations.first[:model],
            engine: :ev)

        expect(factory.vehicle_list).to all be_a Vehicle
        expect(factory.vehicle_list).to be_an Array
        
        expect(@factory.vehicle_list.first.vin).to eq(expected.vin) #CHEVROLET
        expect(@factory.vehicle_list.first.year).to eq(expected.year) #Volt
        expect(@factory.vehicle_list.first.make).to eq(expected.make) #1G1RC6S55J
        expect(@factory.vehicle_list.first.model).to eq(expected.model) #2018
        expect(@factory.vehicle_list.first.engine).to eq(expected.engine) #:ev
        expect(@factory.vehicle_list.first.plate_type).to be nil
        expect(@factory.vehicle_list.first.registration_date).to be nil
      end
    end
end

