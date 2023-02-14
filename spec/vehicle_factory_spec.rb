require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'accesses data from api' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
     

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    cars = factory.create_vehicles(wa_ev_registrations)
    
    
# repeat for other elements in the array

    # expect(factory.create_vehicles(wa_ev_registrations)).to eq(cars)
  

  end

  xit 'access data from another dmv #oregon' do
    factory = VehicleFactory.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
        
    locations = factory.create_facilities(or_dmv_office_locations)




    
    # expect(factory.create_vehicles(or_dmv_office_locations)).to eq(or_dmv_office_locations)
    # expect(or_dmv_office_locations[0][:zip_code]).to eq("97321")
  end

  xit 'access data from another dmv #new york' do
    factory = VehicleFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    locations = factory.create_facilities(new_york_facilities)

    require 'pry'; binding.pry

    factory.create_facility (new_york_facilities)
    expect(factory.create_vehicles(new_york_facilities)).to eq(new_york_facilities)
    expect(new_york_facilities[0][:city]).to eq("JAMESTOWN")
  end

  xit 'access data from another dmv #missouri' do
    factory = VehicleFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
    factory.create_vehicles(missouri_facilities)
    expect(factory.create_vehicles(missouri_facilities)).to eq(missouri_facilities)
    expect(missouri_facilities[0][:state]).to eq("MO")
  end
end