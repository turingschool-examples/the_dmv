require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'accesses data from api' do
    factory = VehicleFactory.new
    wa_ev_registrations = :wa_ev_registrations

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    factory.create_vehicles(wa_ev_registrations)

    expect(factory.create_vehicles(wa_ev_registrations)).to eq(DmvDataService.new.send(:wa_ev_registrations))
  end

  it 'access data from another dmv #oregon' do
    factory = VehicleFactory.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    
    expect(factory).to be_an_instance_of(VehicleFactory)
        
    factory.create_vehicles(or_dmv_office_locations)
    
    expect(factory.create_vehicles(or_dmv_office_locations)).to eq(DmvDataService.new.send)
      
    
    
  end
end