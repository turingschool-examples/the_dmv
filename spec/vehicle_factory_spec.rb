require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'creates vehicle objects' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(factory.create_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
  end
end