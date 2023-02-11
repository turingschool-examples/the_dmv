require 'rspec'
require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)
  end

  describe '#create_vehicles' do
    it 'can create and store vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
      # require 'pry'; binding.pry
      expect(factory.vehicles).to be_a(Array)
      expect(factory.vehicles.first).to be_a(Vehicle)
      expect(factory.vehicles.length).to eq(1000)
    end
  end
end