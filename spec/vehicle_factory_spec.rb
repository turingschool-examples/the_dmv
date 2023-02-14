require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)
  end

  it 'creates vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_ev_vehicles = factory.create_vehicles(wa_ev_registrations)

    expect(wa_ev_vehicles).to be_an(Array)
    expect(wa_ev_vehicles[0]).to be_a(Vehicle)
    expect(wa_ev_vehicles[0].engine).to eq(:ev)

    ny_registrations = DmvDataService.new.ny_registrations
    ny_vehicles = factory.create_vehicles(ny_registrations)

    expect(ny_vehicles).to be_an(Array)
    expect(ny_vehicles[0]).to be_a(Vehicle)
  end
end
