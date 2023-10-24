require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do
    factory = VehicleFactory.new

    expect(VehicleFactory.new).to be_an_instance_of(VehicleFactory)
  end

  it 'also exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(wa_ev_registrations = DmvDataService.new.wa_ev_registrations).to be_an_instance_of(Array)
  end

  it 'takes the registered vehicles and arrays it into a Vehicle' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.create_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
  end

end