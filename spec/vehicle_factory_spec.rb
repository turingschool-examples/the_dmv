require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)
  end

  it 'creates vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    vehicles = factory.create_vehicles(wa_ev_registrations)

    expect(vehicles).to be_an(Array)
    expect(vehicles[0]).to be_a(Vehicle)
  end
end
