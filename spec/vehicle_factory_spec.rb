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
        # expect(@factory.create_vehicles(@wa_ev_registrations).length).to eq(1000)
        expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
        expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end




end

