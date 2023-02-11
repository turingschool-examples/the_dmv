require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a VehicleFactory
    end
  end

  describe '#create_vehicles' do
    it 'can create multiple vehicle objects' do
      expect (@factory.create_vehicles(@wa_ev_registrations)).to be_a Array
      expect (@factory.create_vehicles(@wa_ev_registrations).first).to be_a Vehicle
      expect (@factory.create_vehicles(@wa_ev_registrations).last).to be_a Vehicle
      expect (@factory.create_vehicles(@wa_ev_registrations).sample).to be_a Vehicle
    end

    it 'creates vehicle objects for all vehicles in data set' do
      expect(@factory.create_vehicles(@wa_ev_registrations).count).to eq(@wa_ev_registrations.count)
    end

    it 'can add attributes to the vehicle objects' do
      expect(@factory.create_vehicles(@wa_ev_registrations).vin).to be_a String
      expect(@factory.create_vehicles(@wa_ev_registrations).year).to be_a String
      expect(@factory.create_vehicles(@wa_ev_registrations).make).to be_a String
      expect(@factory.create_vehicles(@wa_ev_registrations).model).to be_a String
      expect(@factory.create_vehicles(@wa_ev_registrations).engine).to eq(:ev)
      expect(@factory.create_vehicles(@wa_ev_registrations).plate_type).to eq(nil)
      expect(@factory.create_vehicles(@wa_ev_registrations).registration_date).to eq(nil)
    end
  end
end
