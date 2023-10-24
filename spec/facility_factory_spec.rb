require 'spec_helper'

RSpec.describe FacilityFactory do
  it "exists" do
    facility_factory_1 = FacilityFactory.new
    expect(facility_factory_1).to be_a FacilityFactory
  end


  it "can access the CO DMV facilities api" do
    facility_factory_1 = FacilityFactory.new
    colorado_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    
    expect(colorado_dmv_office_locations.first[:state]).to eq("CO")
    expect(facility_factory_1.create_facility(colorado_dmv_office_locations)).to be_a Array
    expect(facility_factory_1.create_facility(colorado_dmv_office_locations).first).to be_a Facility
    expect(facility_factory_1.create_facility(colorado_dmv_office_locations).first.address).to eq("2855 Tremont Place, Suite 118, Denver, CO 80205")
    expect(facility_factory_1.create_facility(colorado_dmv_office_locations).first.hours).to be_a String
  end

  it "can access the New York DMV facilities api" do
    facility_factory_1 = FacilityFactory.new
    new_york_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    
    expect(new_york_dmv_office_locations.first[:state]).to eq("NY")
    expect(facility_factory_1.create_facility(new_york_dmv_office_locations)).to be_a Array
    expect(facility_factory_1.create_facility(new_york_dmv_office_locations).first).to be_a Facility
    expect(facility_factory_1.create_facility(new_york_dmv_office_locations).first.address).to eq("168-46 91ST AVE., 2ND FLR, JAMAICA, NY 11432")
    expect(facility_factory_1.create_facility(new_york_dmv_office_locations).first.hours).to be_a String
  end

  it "can access the Missouri DMV facilities api" do
    facility_factory_1 = FacilityFactory.new
    missouri_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    
    expect(missouri_dmv_office_locations.first[:state]).to eq("MO")
    expect(facility_factory_1.create_facility(missouri_dmv_office_locations)).to be_a Array
    expect(facility_factory_1.create_facility(missouri_dmv_office_locations).first).to be_a Facility
    expect(facility_factory_1.create_facility(missouri_dmv_office_locations).first.address).to eq("3164 TELEGRAPH ROAD, ST LOUIS, MO 63125")
    expect(facility_factory_1.create_facility(missouri_dmv_office_locations).first.hours).to eq("Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00")
    expect(facility_factory_1.create_facility(missouri_dmv_office_locations).first.holidays_closed).to eq("Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
  end
end