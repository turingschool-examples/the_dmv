require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/existing_facility'

RSpec.describe ExistingFacility do
    it "can initialize" do 
        existing_facility = ExistingFacility.new
        colorado_facilities = DmvDataService.new.co_dmv_office_locations
        existing_facility.read_information(colorado_facilities)
    end
    it "can initialize other facilities" do
        existing_facility_2 = ExistingFacility.new
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        existing_facility_2.read_information(new_york_facilities)
        #multiple instances exist of a single address, overriding some data, didnt have time to refactor that out

        existing_facility_3 = ExistingFacility.new
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations
        existing_facility_3.read_information(missouri_facilities)
        #Note: I decided against adding the "services" of Missouri DMVs into the array.  Their "services" are better accessibility features, not actual services the facility can do on a registrant.
    end


end
