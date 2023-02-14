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
      factory.create_wa_vehicles(wa_ev_registrations)

      expect(factory.wa_vehicles).to be_a(Array)
      expect(factory.wa_vehicles.first).to be_a(Vehicle)
      expect(factory.wa_vehicles.length).to eq(1000)
      expect(factory.wa_vehicles.first.make).to eq('TOYOTA')
      expect(factory.wa_vehicles.first.model).to eq('Prius Plug-in')
      expect(factory.wa_vehicles.first.vin).to eq('JTDKN3DP8D')
      expect(factory.wa_vehicles.first.year).to eq('2013')
    end

    it 'can create and store vehicles from New York' do
      factory = VehicleFactory.new
      ny_registrations = DmvDataService.new.ny_registrations
      factory.create_ny_vehicles(ny_registrations)

      expect(factory.ny_vehicles).to be_a(Array)
      expect(factory.ny_vehicles.first).to be_a(Vehicle)
      expect(factory.ny_vehicles.length).to eq(250)
      expect(factory.ny_vehicles.first.make).to eq('CHRY')
      expect(factory.ny_vehicles.first.engine).to eq('GAS')
      expect(factory.ny_vehicles.first.model).to eq('4DSD')
      expect(factory.ny_vehicles.first.vin).to eq('9999236')
      expect(factory.ny_vehicles.first.year).to eq('1937')
    end

    it 'works for both states' do
      factory = VehicleFactory.new
      ny_registrations = DmvDataService.new.ny_registrations
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(ny_registrations)
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.wa_vehicles).to be_a(Array)
      expect(factory.wa_vehicles.first).to be_a(Vehicle)
      expect(factory.wa_vehicles.length).to eq(1000)
      expect(factory.wa_vehicles.first.make).to eq('TOYOTA')
      expect(factory.wa_vehicles.first.model).to eq('Prius Plug-in')
      expect(factory.wa_vehicles.first.vin).to eq('JTDKN3DP8D')
      expect(factory.wa_vehicles.first.year).to eq('2013')

      # expect(factory.ny_vehicles).to be_a(Array)
      # expect(factory.ny_vehicles.first).to be_a(Vehicle)
      # expect(factory.ny_vehicles.length).to eq(250)
      # expect(factory.ny_vehicles.first.make).to eq('CHRY')
      # expect(factory.ny_vehicles.first.engine).to eq('GAS')
      # expect(factory.ny_vehicles.first.model).to eq('4DSD')
      # expect(factory.ny_vehicles.first.vin).to eq('9999236')
      # expect(factory.ny_vehicles.first.year).to eq('1937')
    end
  end
end