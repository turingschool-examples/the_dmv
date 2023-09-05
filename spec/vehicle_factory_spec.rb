require 'spec_helper'

RSpec.describe Factory do
  before(:each) do
    @factory = Factory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(Factory)
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles based on API data' do
      creation_log = @factory.create_vehicles(@wa_ev_registrations)
      expect(creation_log).to be_an_instance_of(Array)
      creation_log.each do |vehicle|
        expect(vehicle).to be_an_instance_of(Vehicle)
      end
    end

    it 'creates vehicles with all data' do
      creation_log = @factory.create_vehicles(@wa_ev_registrations)
      expect(creation_log).to be_an_instance_of(Array)
      creation_log.each do |vehicle|
        expect(vehicle.vin).not_to eq(nil)
        expect(vehicle.year).not_to eq(nil)
        expect(vehicle.make).not_to eq(nil)
        expect(vehicle.model).not_to eq(nil)
        expect(vehicle.engine).not_to eq(nil)
      end
    end

    it 'can create vehicles with all data from a different data set' do
      @ny_boat_registrations = DmvDataService.new.ny_boat_registrations
      creation_log = @factory.create_vehicles(@ny_boat_registrations)
      expect(creation_log).to be_an_instance_of(Array)
      creation_log.each do |vehicle|
        expect(vehicle.vin).not_to eq(nil)
        expect(vehicle.year).not_to eq(nil)
        expect(vehicle.make).not_to eq(nil)
        expect(vehicle.model).not_to eq(nil)
        expect(vehicle.engine).not_to eq(nil)
      end
    end
  end
end
        