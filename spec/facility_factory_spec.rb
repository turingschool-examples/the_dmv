require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility = FacilityFactory.new
    @or_facilities = DmvDataService.new.or_dmv_office_locations
    @ny_facilities = DmvDataService.new.ny_dmv_office_locations
    @mo_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe "initialize" do
    it "can itialize" do
      expect(@facility).to be_an_instance_of(FacilityFactory)
    end
  end

  describe "create_facility" do
    it "creates facility" do

      expect(@facility.create_facility(@or_facilities)).to all(be_an_instance_of Facility)
      expect(@facility.create_facility(@ny_facilities)).to all(be_an_instance_of Facility)
      expect(@facility.create_facility(@mo_facilities)).to all(be_an_instance_of Facility)

    end
  end
end