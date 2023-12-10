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
    describe"#creates factories collection" do
    it "creates a collection with no nil or empty values" do
        expect(@factory.create_facilities(@co_dmv_locations)).to be_an_instance_of (Array)
        expect(@factory.create_facilities(@co_dmv_locations).empty?).to eq(false)
        expect(@factory.create_facilities(@co_dmv_locations).include?(nil)).to eq(false)
        expect(@factory.facilities.first).to eq(@factory.create_facilities(@co_dmv_locations).first)
    end
    it "assigns the attributes correctly" do
        expect(@factory.create_facilities(@co_dmv_locations).first).to be_an_instance_of (Facility)
        expect(@factory.create_facilities(@co_dmv_locations).first.name).to eq (@co_dmv_locations.first[:dmv_office])
        expect(@factory.create_facilities(@co_dmv_locations).first.address).to eq ((@co_dmv_locations.first[:address_li])+" "+(@co_dmv_locations.first[:address__1])+" "+(@co_dmv_locations.first[:city])+" "+(@co_dmv_locations.first[:state])+" "+(@co_dmv_locations.first[:zip]))
        expect(@factory.create_facilities(@co_dmv_locations).first.phone).to eq (@co_dmv_locations.first[:phone])
        expect(@factory.create_facilities(@co_dmv_locations).first.services).to eq (@co_dmv_locations.first[:services])
    end
end
end