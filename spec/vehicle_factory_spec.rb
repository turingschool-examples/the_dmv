require './lib/vehicle_factory'
require 'rspec'

RSpec.describe VehicleFactory do
  it 'exists' do
  factory=VehicleFactory.new

  expect(factory).to be_an_instance_of(VehicleFactory)
  end
  
  it 'loads vehicles' do
    factory=VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)

    expect(factory.vehicles.length).to eq(1000)
  end
end