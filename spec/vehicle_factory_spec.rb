require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#intialize' do
    it 'exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(factory).to be_a(VehicleFactory)
  end
  it 'can make cars' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)

    expect(factory.create_vehicles(wa_ev_registrations)).to be_a(Array)
    expect(factory.vehicles.first).to be_a(Vehicle)
    end
  end
end