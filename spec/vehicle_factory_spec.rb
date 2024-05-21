require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
  end

RSpec.describe VehicleFactory do
    before (:each) do
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory = VehicleFactory.new
       
    end 

    it 'can create bulk vehicles' do
        expect(@factory.create_vehicles(@wa_ev_registrations).length).to eq(1000)
        expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
        expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
      
        expect(@factory.create_vehicles(@wa_ev_registrations)[0].vin).to eq("1N4AZ1BV0R")
        expect(@factory.create_vehicles(@wa_ev_registrations)[0].year).to eq("2024")
        expect(@factory.create_vehicles(@wa_ev_registrations)[0].make).to eq("NISSAN")
        expect(@factory.create_vehicles(@wa_ev_registrations)[0].model).to eq("Leaf")
      
        expect(@factory.create_vehicles(@wa_ev_registrations)[250].vin).to eq("5YJYGAEE3M")
        expect(@factory.create_vehicles(@wa_ev_registrations)[250].year).to eq("2021")
        expect(@factory.create_vehicles(@wa_ev_registrations)[250].make).to eq("TESLA")
        expect(@factory.create_vehicles(@wa_ev_registrations)[250].model).to eq("Model Y")
      
    end
end

