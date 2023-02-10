require 'rspec'
require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    it 'can initialize' do
    cowans_vehicle_factory = VehicleFactory.new

    expect(cowans_vehicle_factory).to be_a(VehicleFactory)
    end
  end

  describe 'can make cars' do
    it 'can import external data' do
    cowans_vehicle_factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)

    expect(cowans_vehicle_factory.vehicle_data.length).to eq(1000)
    end
  end
end