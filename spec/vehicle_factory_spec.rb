require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(factory).to be_a(VehicleFactory)
  end

  it 'can create vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(factory.create_vehicles_by_state(wa_ev_registrations)).to eq(1000)
    expect(factory.create_vehicles_by_state(wa_ev_registrations)).to be_a(Vehicle)
  end
end