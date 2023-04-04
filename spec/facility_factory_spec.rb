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
        
      end
    end
  end
end
