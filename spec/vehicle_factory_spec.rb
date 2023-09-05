require 'spec_helper'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'exists' do
      factory = VehicleFactory.new
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#Accessing API' do
    it 'connects to API' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(wa_ev_registrations = DmvDataService.new.wa_ev_registrations).to be_a(Array)
    end

    it 'returns vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      new_vehicles = factory.create_vehicles(wa_ev_registrations)
      require 'pry'; binding.pry
      expect(new_vehicles).to be_a(Array)
      expect(new_vehicles).to all be_a(Vehicle)
    end
  end
end