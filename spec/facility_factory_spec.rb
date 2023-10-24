require 'pry'
require 'spec_helper'
require './lib/facility'
require './lib/facility_factory'



RSpec.describe FacilityFactory do
  it "can initialize" do
    facility_factory = FacilityFactory.new
    facilities_data = DmvDataService.new.co_dmv_office_locations

    expect(facility_factory).to be_an_instance_of(FacilityFactory)
  end

  it "can generate facilities" do
    facility_factory = FacilityFactory.new
    facilities_data = DmvDataService.new.co_dmv_office_locations

    expect(facility_factory.create_facilities(facilities_data)).not_to eq(nil)
  end

  it "can store data in facility_instances" do
    facility_factory = FacilityFactory.new
    facilities_data = DmvDataService.new.co_dmv_office_locations
    facility_factory.create_facilities(facilities_data)

    expect(facility_factory.facility_instances).not_to eq(nil)
    expect(facility_factory.facility_instances.empty?).not_to eq(true)

    facility_factory.facility_instances.map do |facility|
      expect(facility).to be_an_instance_of(Facility)
    end
  end

  it "can generate NY facilities" do
    facility_factory = FacilityFactory.new
    facilities_data = DmvDataService.new.ny_dmv_office_locations
    facility_factory.create_facilities(facilities_data)

    expect(facility_factory.create_facilities(facilities_data)).not_to eq(nil)
  end
  
  it "can generate MO facilities" do
    facility_factory = FacilityFactory.new
    facilities_data = DmvDataService.new.mo_dmv_office_locations
    facility_factory.create_facilities(facilities_data)
    binding.pry
    expect(facility_factory.create_facilities(facilities_data)).not_to eq(nil)
  end
  
end

