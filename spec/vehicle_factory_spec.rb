require 'spec_helper'

RSpec.describe VehicleFactory do
  let (:factory) { VehicleFactory.new }
  let (:wa_ev_registrations) { DmvDataService.new.wa_ev_registrations }
  it 'exists' do
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it 'has no vehicles by default' do
    expect(factory.vehicles).to be_empty
  end

  it 'can parse registration data from JSON to create vehicles and change their engine to ev if it is nil' do
    vehicles = factory.create_vehicles(wa_ev_registrations)

    expect(vehicles[5].engine).to eq(:ev)

    expect(vehicles[0]).to be_an_instance_of(Vehicle)
  end

  # it 'can change vehicles to :ev engine' do
  #   vehicles = factory.create_vehicles(wa_ev_registrations)
  
  #   expect(factory.vehicles[0].engine).to eq(nil)
  
  #   factory.set_to_electric(vehicles)
  
  #   expect(factory.vehicles[0].engine).to eq(:ev)
  # end
end