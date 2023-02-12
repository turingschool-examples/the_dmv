require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'accesses data from api' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    factory.create_vehicles(wa_ev_registrations)

    expect(factory.create_vehicles(wa_ev_registrations)).to eq(DmvDataService.new.wa_ev_registrations
    )
  end
end