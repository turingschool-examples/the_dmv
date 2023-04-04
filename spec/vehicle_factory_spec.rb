require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do

    factory = VehicleFactory.new

    expect(factory).to be_a VehicleFactory
  end

  it 'can create vehicles with API data' do
    factory = VehicleFactory.new

    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    factory.create_vehicles(wa_ev_registrations)
   
    expect(factory.vehicles[0]).to be_a Vehicle
  end
end
