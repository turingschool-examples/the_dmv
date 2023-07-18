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
end
