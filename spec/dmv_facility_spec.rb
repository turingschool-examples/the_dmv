require 'spec_helper'

RSpec.describe DMVFacility do
  before(:each) do

    @dmv_facility_1 = DMVFacility.new
    @array_of_facilities = DmvDataService.new.or_dmv_office_locations
    # require 'pry'; binding.pry
  end

  it "exists" do 
    expect(@dmv_facility_1).to be_an_instance_of(DMVFacility)
  end

  it "can make an array of new DMV Facilities" do

    expect(@dmv_facility_1.create_dmvs(@array_of_facilities).first).to be_a(Facility)
    expect(@dmv_facility_1.create_dmvs(@array_of_facilities)).to be_an(Array)
require 'pry'; binding.pry
  end


end