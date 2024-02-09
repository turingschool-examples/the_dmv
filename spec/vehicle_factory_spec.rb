require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory).to be_an_instance_of(VehicleFactory)
  end
end