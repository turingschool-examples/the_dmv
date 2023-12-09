require "./lib/office_locations"
require "./lib/facility"
require "./lib/dmv_data_service"

RSpec.describe OfficeLocations do
    it "exists" do
        office_location = OfficeLocations.new

        expect(office_location).to be_an_instance_of OfficeLocations
    end

    it "has Colorado DMV information" do
        office_location = OfficeLocations.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    
        expect(office_location.co_create_facility(co_dmv_office_locations)).to be_a Array
        expect(office_location.co_create_facility(co_dmv_office_locations).first).to be_instance_of Facility
        expect(office_location.co_create_facility(co_dmv_office_locations).first.name).not_to be nil
        expect(office_location.co_create_facility(co_dmv_office_locations).first.address).not_to be nil
        expect(office_location.co_create_facility(co_dmv_office_locations).first.phone).not_to be nil
        expect(office_location.co_create_facility(co_dmv_office_locations).first.services).not_to be nil
        expect(office_location.co_create_facility(co_dmv_office_locations).first.registered_vehicle).to eq([])
        expect(office_location.co_create_facility(co_dmv_office_locations).first.collected_fees).to eq(0)
    end

    it "has NY DMV information" do
        office_location = OfficeLocations.new
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations

        expect(office_location.ny_create_facility(new_york_facilities)).to be_a Array
        expect(office_location.ny_create_facility(new_york_facilities).first).to be_instance_of Facility
        expect(office_location.ny_create_facility(new_york_facilities).first.name).not_to be nil
        expect(office_location.ny_create_facility(new_york_facilities).first.address).not_to be nil
        expect(office_location.ny_create_facility(new_york_facilities).first.phone).not_to be nil
        expect(office_location.ny_create_facility(new_york_facilities).first.services).not_to be nil
        expect(office_location.ny_create_facility(new_york_facilities).first.registered_vehicle).to eq([])
        expect(office_location.ny_create_facility(new_york_facilities).first.collected_fees).to eq(0)
    end

    it "has MO DMV information" do
        office_location = OfficeLocations.new
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations

        expect(office_location.mo_create_facility(missouri_facilities)).to be_a Array
        expect(office_location.mo_create_facility(missouri_facilities).first).to be_instance_of Facility
        expect(office_location.mo_create_facility(missouri_facilities).first.name).not_to be nil
        expect(office_location.mo_create_facility(missouri_facilities).first.address).not_to be nil
        expect(office_location.mo_create_facility(missouri_facilities).first.phone).not_to be nil
        expect(office_location.mo_create_facility(missouri_facilities).first.services).not_to be nil
        expect(office_location.mo_create_facility(missouri_facilities).first.registered_vehicle).to eq([])
        expect(office_location.mo_create_facility(missouri_facilities).first.collected_fees).to eq(0)
    end
end