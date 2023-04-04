require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_factory'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @dmv_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  
  end

  describe "#Facility Factory" do
    it "exists" do 
      expect(@facility_factory).to be_a(FacilityFactory)
      # require 'pry'; binding.pry
    end

  end

end


