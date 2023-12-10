require "rspec"
require "./lib/dmv_data_service"
require "./lib/facility"
require "./lib/facility_factory"

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
        @co_dmv_locations = DmvDataService.new.co_dmv_office_locations
    end
    describe "#Initialize" do
        it "exists" do
            expect(@factory).to be_an_instance_of (FacilityFactory)
        end

        it "starts with no facilities" do
            expect(@factory.facilities).to eq ([])
        end
    end
end