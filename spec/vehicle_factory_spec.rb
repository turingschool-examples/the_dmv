require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'exists' do 
    factory = VehicleFactory.new

    expect(factory).to be_a(VehicleFactory)
  end

  it 'creates new vehicles for washington' do 
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    vehicle = factory.create_vehicles(wa_ev_registrations)
   
    # expect(factory.create_vehicles(wa_ev_registrations)).to eq()
    # factory.create_vehicles(wa_ev_registrations)
    expect(vehicle[1].year).to eq("2014")
  end

end
