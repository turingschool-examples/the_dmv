require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'can make new vehicles' do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    car_factory = VehicleFactory.new
    expect(car_factory.create_vehicles(wa_ev_registrations)).to eq([])
  end
end