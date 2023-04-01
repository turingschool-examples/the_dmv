require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'can make new vehicles' do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory = VehicleFactory.new
    expect(factory.create_vehicles(wa_ev_registrations)).to eq([wa_ev_registrations])
  end
end