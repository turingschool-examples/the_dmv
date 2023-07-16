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
       expect(@colorado.facilities_created).to eq([])
       @colorado.create_facilities(@colorado_facilities_data)
      #  require 'pry';binding.pry
       expect(@colorado.facilities_created).to all be_a Facility
    end
  end

  describe "#format_facility_name" do 
    it "formats CO facilities names" do 
      specific_co_facility_sample = {"the_geom":{"type":"Point","coordinates":[-104.97443112500002,39.75525297420336]},"dmv_id":"1","dmv_office":"DMV Tremont Branch","address_li":"2855 Tremont Place","address__1":"Suite 118","city":"Denver","state":"CO","zip":"80205","phone":"(720) 865-4600","hours":"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.","services_p":"vehicle titles, registration, renewals;  VIN inspections","parking_no":"parking available in the lot at the back of the bldg (Glenarm Street)","photo":"images/Tremont.jpg","address_id":"175164",":@computed_region_nku6_53ud":"1444"}
      random_co_facility_sample = @colorado_facilities_data.sample
      #sample method is great here, but can only check
      expect(@colorado.format_facility_name(specific_co_facility_sample)).to eq("DMV Tremont Branch")
      expect(@colorado.format_facility_name(random_co_facility_sample)).to be_a String
    end
  end
end