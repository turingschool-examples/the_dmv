require "rspec"
require "./lib/dmv_data_service"
require "./lib/facility"
require "./lib/facility_factory"

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
        @co_dmv_locations = DmvDataService.new.co_dmv_office_locations
        @ny_dmv_locations = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_locations = DmvDataService.new.mo_dmv_office_locations
    end
    describe "#Initialize" do
        it "exists" do
            expect(@factory).to be_an_instance_of (FacilityFactory)
        end

        it "starts with no facilities" do
            expect(@factory.facilities).to eq ([])
        end
    end
    describe"#creates factories collection for CO Locations" do
    it "creates a collection with no nil or empty values" do
        @factory.create_facilities(@co_dmv_locations)
        expect(@factory.facilities).to be_an_instance_of (Array)
        expect(@factory.facilities.empty?).to eq(false)
        expect(@factory.facilities.include?(nil)).to eq(false)
    end
    it "assigns the attributes correctly" do
        @factory.create_facilities(@co_dmv_locations)
        expect(@factory.facilities.first).to be_an_instance_of (Facility)
        expect(@factory.facilities.first.name).to eq (@co_dmv_locations.first[:dmv_office])
        expect(@factory.facilities.first.address).to eq ((@co_dmv_locations.first[:address_li].to_s)+" "+(@co_dmv_locations.first[:address__1].to_s)+" "+(@co_dmv_locations.first[:city])+" "+(@co_dmv_locations.first[:state])+" "+(@co_dmv_locations.first[:zip]))
        expect(@factory.facilities.first.phone).to eq (@co_dmv_locations.first[:phone])
        expect(@factory.facilities.first.services).to eq (@co_dmv_locations.first[:services_p])
    end
    end

    describe"#creates factories collection for NY Locations" do
    it "creates a collection with no nil or empty values" do
        @factory.create_facilities(@ny_dmv_locations)
        expect(@factory.facilities).to be_an_instance_of (Array)
        expect(@factory.create_facilities(@ny_dmv_locations).empty?).to eq(false)
        expect(@factory.create_facilities(@ny_dmv_locations).include?(nil)).to eq(false)
    end
    it "assigns the attributes correctly" do
        expect(@factory.create_facilities(@ny_dmv_locations).first).to be_an_instance_of (Facility)
        expect(@factory.create_facilities(@ny_dmv_locations).first.name).to eq (@ny_dmv_locations.first[:office_name])
        expect(@factory.create_facilities(@ny_dmv_locations).first.address).to eq ((@ny_dmv_locations.first[:street_address_line_1].to_s)+" "+(@ny_dmv_locations.first[:street_address_line_2].to_s)+" "+(@ny_dmv_locations.first[:city])+" "+(@ny_dmv_locations.first[:state])+" "+(@ny_dmv_locations.first[:zip_code]))
        expect(@factory.create_facilities(@ny_dmv_locations).first.phone).to eq (@ny_dmv_locations.first[:phone])
    end
    end
    describe"#creates factories collection for MO Locations" do
    it "creates a collection with no nil or empty values" do
        expect(@factory.create_facilities(@mo_dmv_locations)).to be_an_instance_of (Array)
        expect(@factory.create_facilities(@mo_dmv_locations).empty?).to eq(false)
        expect(@factory.create_facilities(@mo_dmv_locations).include?(nil)).to eq(false)
        expect(@factory.facilities.first).to eq(@factory.create_facilities(@mo_dmv_locations).first)
    end
    it "assigns the attributes correctly" do
        expect(@factory.create_facilities(@mo_dmv_locations).first).to be_an_instance_of (Facility)
        expect(@factory.create_facilities(@mo_dmv_locations).first.name).to eq (@mo_dmv_locations.first[:office_name])
        expect(@factory.create_facilities(@mo_dmv_locations).first.address).to eq ((@mo_dmv_locations.first[:street_address_line_1].to_s)+" "+(@ny_dmv_locations.first[:street_address_line_2].to_s)+" "+(@ny_dmv_locations.first[:city])+" "+(@ny_dmv_locations.first[:state])+" "+(@ny_dmv_locations.first[:zip_code]))
        expect(@factory.create_facilities(@mo_dmv_locations).first.phone).to eq (@mo_dmv_locations.first[:phone])
        expect(@factory.create_facilities(@mo_dmv_locations).first.services).to eq (@mo_dmv_locations.first[:services])
        expect(@factory.create_facilities(@mo_dmv_locations).first.services).to eq (@mo_dmv_locations.first[:additional_license_office_info])
    end
    end
end