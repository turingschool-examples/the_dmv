require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_creator'

RSpec.describe FacilityCreator do

  before(:each) do
    @creator = FacilityCreator.new
    @co_dmv_registrations = [] 
    @co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[0]
    @co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[1]
    @co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[2]
    @check_results = @creator.create_facility(@co_dmv_registrations)
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
  end 

  it 'can take Colorado information and return new facilities per Facility class' do
    expect(@check_results.class).to eq(Array)
    expect(@check_results[0].class).to be(Facility)
  end

  it 'should return initial values of empty arrays and 0 collected fees per each facility' do
    expect(@check_results[0].collected_fees).to eq(0)
    expect(@check_results[0].registered_vehicles).to eq([])
  end

  it 'can add a service and register a vehicle, changing the collected fees' do
    @check_results[0].add_service("Vehicle Registration")
    @check_results[0].register_vehicle(@cruz)
    expect(@check_results[0].collected_fees).to eq(100)
    expect(@check_results[0].registered_vehicles.count).to be(1)
  end

  it 'can accept information from New York submissions' do
    new_york_facilities = []
    new_york_facilities << DmvDataService.new.ny_dmv_office_locations[0]
    @check_results << @creator.create_facility(new_york_facilities)
    expect(DmvDataService.new.ny_dmv_office_locations[0].class).to be(Hash)
    expect(@check_results[3].to_s).to include("NY")
    expect(@check_results[3].class).to be(Array)
  end

  it 'can reformat New York phone number entry to match (123) 456-7890 convention' do
    new_york_facilities = []
    new_york_facilities << DmvDataService.new.ny_dmv_office_locations[0]
    @check_results << @creator.create_facility(new_york_facilities)
    expect(@check_results[3].to_s).to include("(716) 858-7450")
  end

  it 'can accept information from Missouri submissions' do
    missouri_facilities = []
    missouri_facilities <<  DmvDataService.new.mo_dmv_office_locations[0]
    @check_results << @creator.create_facility(missouri_facilities) 
    expect(DmvDataService.new.mo_dmv_office_locations[0].class).to be(Hash)
    expect(@check_results[3].to_s).to include("MO")
    expect(@check_results[3].class).to be(Array)
  end

end