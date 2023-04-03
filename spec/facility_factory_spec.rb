require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility = FacilityFactory.new
    @or_facilities = DmvDataService.new.or_dmv_office_locations
    @ny_facilities = DmvDataService.new.ny_dmv_office_locations
    @mo_facilities = DmvDataService.new.mo_dmv_office_locations
    require 'pry'; binding.pry
  end

  describe "initialize" do
    it "can itialize" do
      expect(@facility).to be_an_instance_of(FacilityFactory)
    end
  end

  describe "create_facility_or" do
    it "creates Oregons facility" do

      expect(@facility.create_facility_or(@or_facilities)).to all(be_an_instance_of Facility)
      expect(@facility.create_facility(@mo_facilities)).to all(be_an_instance_of Facility)
    end
  end

  describe "create_facility_ny" do
    it "creates NY facility" do

    expect(@facility.create_facility_ny(@ny_facilities)).to all(be_an_instance_of Facility)

    end
  end

end