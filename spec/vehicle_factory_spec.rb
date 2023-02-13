require 'rspec'
require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'exists' do
      factory = VehicleFactory.new
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can create and store vehicles from Washington' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.vehicles).to be_a(Array)
      expect(factory.vehicles.first).to be_a(Vehicle)
      expect(factory.vehicles.length).to eq(1000)
    end

    it 'can create and store vehicles from New York' do
      factory = VehicleFactory.new
      ny_registrations = DmvDataService.new.ny_registrations
      factory.create_ny_vehicles(ny_registrations)

      expect(factory.ny_vehicles).to be_a(Array)
      expect(factory.ny_vehicles.first).to be_a(Vehicle)
      expect(factory.ny_vehicles.length).to eq(250)
      expect(factory.ny_vehicles.first.make).to eq('CHRY')
    end
  end
end