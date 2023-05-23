require './spec/spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)
  end

  it 'can create vehicles with registrations' do
    factory = VehicleFactory.new 
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)
    expect(wa_ev_registrations.size).to eq(factory.vehicles.size)
  end
end