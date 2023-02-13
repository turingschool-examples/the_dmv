require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'accesses data from api' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    factory.create_vehicles(wa_ev_registrations)
    expect(factory.create_vehicles(wa_ev_registrations)).to eq(wa_ev_registrations)
  end

  it 'access data from another dmv #oregon' do
    factory = VehicleFactory.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    
    expect(factory).to be_an_instance_of(VehicleFactory)
        
    factory.create_vehicles(or_dmv_office_locations)
    expect(factory.create_vehicles(or_dmv_office_locations)).to eq(or_dmv_office_locations)
  end

  it 'access data from another dmv #new york' do
    factory = VehicleFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    
    expect(factory).to be_an_instance_of(VehicleFactory)
        
    factory.create_vehicles(new_york_facilities)
    expect(factory.create_vehicles(new_york_facilities)).to eq(new_york_facilities)
  end

  it 'access data from another dmv #missouri' do
    factory = VehicleFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
    factory.create_vehicles(missouri_facilities)
    expect(factory.create_vehicles(missouri_facilities)).to eq(missouri_facilities)
  end
end