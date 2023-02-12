require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists from an API' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(factory).to be_an_instance_of(VehicleFactory)
    expect(wa_ev_registrations).to be_an_instance_of(Array)
    expect(wa_ev_registrations.size).to eq(1000)
  end

  it 'creates an inventory of cars and stores them in car_inventory array' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.creates_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
    expect(factory.creates_vehicles(wa_ev_registrations)[1][:city]).to eq("DUPONT")
    expect(factory.car_inventory.count).to eq(2000)
    expect(factory.car_inventory.first.year).to eq(2013)
  end
end