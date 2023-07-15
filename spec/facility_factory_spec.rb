require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do
    @colorado_facilities_data = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities_data = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities_data = DmvDataService.new.mo_dmv_office_locations
    @colorado = FacilityFactory.new
    @new_york = FacilityFactory.new
    @missouri = FacilityFactory.new
    end

  describe "#initialize" do
    it "exists"  do 

      expect(@colorado).to be_a FacilityFactory
    end
  end

  describe "#create_facilities" do
    it "can create new facilities" do
       expect(@colorado.colorado_facilities_created).to eq([])
       @colorado.create_facilities(@colorado_facilities_data)
       expect(@colorado.colorado_facilities_created).to all be_a Facility
    end
  end
end