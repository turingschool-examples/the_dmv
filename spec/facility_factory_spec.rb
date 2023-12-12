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
    end
    describe"#creates factories collection for CO Locations" do
    it "creates a collection with no nil or empty values" do
        expect(@factory.create_facilities(@co_dmv_locations).empty?).to eq(false)
        expect(@factory.create_facilities(@co_dmv_locations).include?(nil)).to eq(false)
        expect(@factory.create_facilities(@co_dmv_locations)).to all(be_an_instance_of Facility)
    end
    it "assigns the attributes correctly" do
        expect(@factory.create_facilities(@co_dmv_locations).first.name).to eq (@co_dmv_locations.first[:dmv_office])
        expect(@factory.create_facilities(@co_dmv_locations).first.address).to eq ((@co_dmv_locations.first[:address_li].to_s)+" "+(@co_dmv_locations.first[:address__1].to_s)+" "+(@co_dmv_locations.first[:city])+" "+(@co_dmv_locations.first[:state])+" "+(@co_dmv_locations.first[:zip]))
        expect(@factory.create_facilities(@co_dmv_locations).first.phone).to eq (@co_dmv_locations.first[:phone])
        expect(@factory.create_facilities(@co_dmv_locations).first.daily_hours).to eq (@co_dmv_locations.first[:hours])
        expect(@factory.create_facilities(@co_dmv_locations).last.name).to eq (@co_dmv_locations.last[:dmv_office])
        expect(@factory.create_facilities(@co_dmv_locations).last.address).to eq ((@co_dmv_locations.last[:address_li].to_s)+" "+(@co_dmv_locations.last[:address__1].to_s)+" "+(@co_dmv_locations.last[:city])+" "+(@co_dmv_locations.last[:state])+" "+(@co_dmv_locations.last[:zip]))
        expect(@factory.create_facilities(@co_dmv_locations).last.phone).to eq (@co_dmv_locations.last[:phone])
        expect(@factory.create_facilities(@co_dmv_locations).last.daily_hours).to eq (@co_dmv_locations.last[:hours])
    end
    end

    describe"#creates factories collection for NY Locations" do
    it "creates a collection with no nil or empty values" do
        expect(@factory.create_facilities(@ny_dmv_locations).empty?).to eq(false)
        expect(@factory.create_facilities(@ny_dmv_locations).include?(nil)).to eq(false)
        expect(@factory.create_facilities(@ny_dmv_locations)).to all(be_an_instance_of Facility)
    end
    it "assigns the attributes correctly" do
        expect(@factory.create_facilities(@ny_dmv_locations).first.name).to eq (@ny_dmv_locations.first[:office_name])
        expect(@factory.create_facilities(@ny_dmv_locations).first.address).to eq ((@ny_dmv_locations.first[:street_address_line_1].to_s)+" "+(@ny_dmv_locations.first[:street_address_line_2].to_s)+" "+(@ny_dmv_locations.first[:city])+" "+(@ny_dmv_locations.first[:state])+" "+(@ny_dmv_locations.first[:zip_code]))
        expect(@factory.create_facilities(@ny_dmv_locations).first.phone).to eq (@ny_dmv_locations.first[:public_phone_number])
        expect(@factory.create_facilities(@ny_dmv_locations).last.name).to eq (@ny_dmv_locations.last[:office_name])
        expect(@factory.create_facilities(@ny_dmv_locations).last.address).to eq ((@ny_dmv_locations.last[:street_address_line_1].to_s)+" "+(@ny_dmv_locations.last[:street_address_line_2].to_s)+" "+(@ny_dmv_locations.last[:city])+" "+(@ny_dmv_locations.last[:state])+" "+(@ny_dmv_locations.last[:zip_code]))
        expect(@factory.create_facilities(@ny_dmv_locations).last.phone).to eq (@ny_dmv_locations.last[:public_phone_number])
        expect(@factory.create_facilities(@ny_dmv_locations).last.daily_hours).to eq (@ny_dmv_locations.last[:monday_beginning_hours]+" to "+@ny_dmv_locations.last[:monday_ending_hours]+", "+@ny_dmv_locations.last[:tuesday_beginning_hours]+" to "+@ny_dmv_locations.last[:tuesday_ending_hours]+",  "+@ny_dmv_locations.last[:wednesday_beginning_hours]+" to"+@ny_dmv_locations.last[:wednesday_ending_hours]+", "+@ny_dmv_locations.last[:thursday_beginning_hours]+" to"+@ny_dmv_locations.last[:thursday_ending_hours]+", "+@ny_dmv_locations.last[:friday_beginning_hours]+" to"+@ny_dmv_locations.last[:friday_ending_hours])
    end
    end
    describe"#creates factories collection for MO Locations" do
    it "creates a collection with no nil or empty values" do
        expect(@factory.create_facilities(@mo_dmv_locations).empty?).to eq(false)
        expect(@factory.create_facilities(@mo_dmv_locations).include?(nil)).to eq(false)
        expect(@factory.create_facilities(@mo_dmv_locations)).to all(be_an_instance_of Facility)
    end
    it "assigns the attributes correctly" do
        expect(@factory.create_facilities(@mo_dmv_locations).first.name).to eq (@mo_dmv_locations.first[:name])
        expect(@factory.create_facilities(@mo_dmv_locations).first.address).to eq ((@mo_dmv_locations.first[:address1].to_s)+" "+(@mo_dmv_locations.first[:city])+" "+(@mo_dmv_locations.first[:state])+" "+(@mo_dmv_locations.first[:zipcode]))
        expect(@factory.create_facilities(@mo_dmv_locations).first.phone).to eq (@mo_dmv_locations.first[:phone])
        expect(@factory.create_facilities(@mo_dmv_locations).first.daily_hours).to eq (@mo_dmv_locations.first[:daysopen])
        expect(@factory.create_facilities(@mo_dmv_locations).first.observed_holidays).to eq (@mo_dmv_locations.first[:holidaysclosed])
        expect(@factory.create_facilities(@mo_dmv_locations).last.name).to eq (@mo_dmv_locations.last[:name])
        expect(@factory.create_facilities(@mo_dmv_locations).last.address).to eq ((@mo_dmv_locations.last[:address1].to_s)+" "+(@mo_dmv_locations.last[:city])+" "+(@mo_dmv_locations.last[:state])+" "+(@mo_dmv_locations.last[:zipcode]))
        expect(@factory.create_facilities(@mo_dmv_locations).last.phone).to eq (@mo_dmv_locations.last[:phone])
        expect(@factory.create_facilities(@mo_dmv_locations).last.daily_hours).to eq (@mo_dmv_locations.last[:daysopen])
        expect(@factory.create_facilities(@mo_dmv_locations).last.observed_holidays).to eq (@mo_dmv_locations.last[:holidaysclosed])
    end
    end
end