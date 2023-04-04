require "rspec"
require "spec_helper"
require "./lib/facility"
require "./lib/facility_factory"
require "./lib/dmv_data_service"

RSpec.describe FacilityFactory do
  describe "Iteration 3" do
    it "exist" do
      facility_maker = FacilityFactory.new

      expect(facility_maker).to be_an_instance_of(FacilityFactory)
    end

    context "different factories" do
      it "can make a facility out of NY facilities" do
        ny_facility_maker = FacilityFactory.new
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        ny_facilities = ny_facility_maker.create_facilities(new_york_facilities)

        expect(ny_facility_maker.create_facilities(new_york_facilities)).to be_an(Array)
      end
    end
  end
end
