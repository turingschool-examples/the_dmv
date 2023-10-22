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
  end

end