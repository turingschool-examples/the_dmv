require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do
    factory = VehicleFactory.new

    expect(factory).to be_instance_of(VehicleFactory)
  end

  it 'creates vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.create_vehicles(wa_ev_registrations)).to be() # How do I write a test for this?
  end

end