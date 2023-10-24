require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do
    factory = VehicleFactory.new

    expect(factory).to be_instance_of(VehicleFactory)
  end

  it 'creates vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.create_vehicles(wa_ev_registrations)).to be_instance_of(Array)
    expect(factory.create_vehicles(wa_ev_registrations).first).to be_instance_of(Vehicle)
    expect(factory.create_vehicles(wa_ev_registrations).first.vin).not_to be(nil)
    expect(factory.create_vehicles(wa_ev_registrations).first.year).not_to be(nil)
    expect(factory.create_vehicles(wa_ev_registrations).first.make).not_to be(nil)
    expect(factory.create_vehicles(wa_ev_registrations).first.model).not_to be(nil)
  end

end