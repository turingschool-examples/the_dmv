require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(wa_ev_registrations).to be_an(Array)
    expect(factory).to be_a(VehicleFactory)
  end

  it 'can create vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(factory.create_vehicles(wa_ev_registrations)).to be_an(Array)
    expect(factory.create_vehicles(wa_ev_registrations).first.engine).to be_an(Symbol)
  end
end