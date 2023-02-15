require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new
    expect(factory).to be_an_instance_of VehicleFactory
  end

  it 'has washington ev data set' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(wa_ev_registrations).to eq(wa_ev_registrations)
  end
  
  it 'can create vehicles with data set' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    created_vehicles = factory.create_vehicles(wa_ev_registrations)
    expect(created_vehicles).to be_a(Array)
    expect(created_vehicles[0]).to be_a(Vehicle)
    expect(created_vehicles.size).to eq(1000)
  end
end