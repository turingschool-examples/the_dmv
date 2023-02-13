require './lib/factory'
require 'rspec'

RSpec.describe VehicleFactory do
  it 'exists' do
  factory=VehicleFactory.new

  expect(factory).to be_an_instance_of(VehicleFactory)
  end
  
  it 'loads vehicles' do
    factory=VehicleFactory.new
    factory.create_vehicles(wa_ev_registrations)

    expect(factory.vehicles.empty?).to eq(false)
  end
end