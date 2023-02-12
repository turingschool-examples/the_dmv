require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists from an API' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it 'creates a hash of cars' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.creates_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
    #expect(factory.wa_ev_registrations.size).to eq(1000)

  end
end