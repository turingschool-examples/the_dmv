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
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_a Array
      expect(vehicles.first).to be_a Vehicle
      expect(vehicles.last).to be_a Vehicle
      expect(vehicles.sample).to be_a Vehicle
    end

    it 'can create vehicle objects for all vehicles in data set' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)

      expect(vehicles.count).to eq(@wa_ev_registrations.count)
    end

    it 'can add attributes to the vehicle objects' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)

      expect(vehicles.sample.vin.length).to eq(10)
      expect(vehicles.sample.year.length).to eq(4)
      expect(vehicles.sample.make).to be_a String
      expect(vehicles.sample.model).to be_a String
      expect(vehicles.sample.engine).to eq(:ev)
      expect(vehicles.sample.plate_type).to eq(nil)
      expect(vehicles.sample.registration_date).to eq(nil)
    end
  end
end
