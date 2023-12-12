require 'spec_helper'

RSpec.describe VehicleFactory do
    it 'exits' do
        factory = VehicleFactory.new
        expect(factory).to be_an_instance_of(VehicleFactory)
        

    end

    it 'can create vehicles' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations

        expect(factory.create_vehicles(wa_ev_registrations)).to be_an Array
        expect(factory.create_vehicles(wa_ev_registrations)[0]).to be_an_instance_of Vehicle
    end

    it 'should be able to construct vehicle attributes' do
        factory = VehicleFactory.new
        vehicle_data = {
            :make=> "Tesla",
            :model=> "model S",
            :vin_1_10=> "5256635263",
            :model_year=> "2020"
        }

        expected_hash = {
            :make=> "Tesla",
            :model=> "model S",
            :vin=> "5256635263",
            :year=> "2020",
            :engine=> :ev
        }

        expect(factory.construct_vehicle_attr_helper(vehicle_data)).to eq(expected_hash)

    end
end