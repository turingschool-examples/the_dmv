require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'accesses data from api' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
     

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    cars = factory.create_vehicles(wa_ev_registrations)

    expect(cars[0].engine).to eq(:ev)
    expect(cars[0].make).to eq("TOYOTA")
    expect(cars[0].model).to eq("Prius Plug-in")
    expect(cars[0].vin).to eq("JTDKN3DP8D")
    expect(cars[0].year).to eq("2013")
    expect(cars[6].year).to eq("2017")
  end

  it 'access data from another dmv #oregon' do
    factory = VehicleFactory.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
        
    locations = factory.create_facilities(or_dmv_office_locations)
   
    expect(locations[0].address).to eq("Albany DMV Office")
    expect(locations[0].phone).to eq("97321")
    expect(locations[0].name).to eq("Transportation, Department of ")
  end

  it 'access data from another dmv #new york' do
    factory = VehicleFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    ny_locations = factory.create_ny_facility(new_york_facilities)

    expect(ny_locations[0].address).to eq("512 WEST 3RD STREET")
    expect(ny_locations[0].phone).to eq("7166618220")
    expect(ny_locations[0].name).to eq("JAMESTOWN")
  end

  it 'access data from another dmv #missouri' do
    factory = VehicleFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    expect(factory).to be_an_instance_of(VehicleFactory)
    
    mo_locations = factory.create_mo_facility(missouri_facilities)
    
    expect(mo_locations[0].phone).to eq("(573) 883-2344")
    expect(mo_locations[0].name).to eq("SAINTE GENEVIEVE ")
    expect(mo_locations[0].address).to eq("753 STE. GENEVIEVE DR")
  end
end