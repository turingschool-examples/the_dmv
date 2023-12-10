require "./lib/office_locations"
require "./lib/facility"
require "./lib/dmv_data_service"

RSpec.describe OfficeLocations do
    it "exists" do
        office_location = OfficeLocations.new

        expect(office_location).to be_an_instance_of OfficeLocations
    end

    it "#create_facility" do
        office_location = OfficeLocations.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations

        expect(office_location.create_facility(co_dmv_office_locations)).to be_a Array
        expect(office_location.create_facility(new_york_facilities)).to be_a Array
        expect(office_location.create_facility(missouri_facilities)).to be_a Array
    end

    it "#daily_hours" do
        office_location = OfficeLocations.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations

        expect(office_location.daily_hours(co_dmv_office_locations)).to be_a Hash
        expect(office_location.daily_hours(new_york_facilities)).to be_a Hash 
        expect(office_location.daily_hours(missouri_facilities)).to be_a Hash

        co_dmv_hours = office_location.daily_hours(co_dmv_office_locations)
        ny_dmv_hours = office_location.daily_hours(new_york_facilities)
        mo_dmv_hours = office_location.daily_hours(missouri_facilities)

        expect(co_dmv_hours.keys.first).to eq("DMV Tremont Branch")
        expect(ny_dmv_hours.keys.first).to eq("IRONDEQUOIT")
        expect(mo_dmv_hours.keys.first).to eq("DEXTER")
    end

    it "#holidays_closed" do
        office_location = OfficeLocations.new
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations

        mo_closed_holidays = office_location.holidays_closed(missouri_facilities)
    
        expect(mo_closed_holidays).to be_a Array
        expect(mo_closed_holidays.first).to include("Independence Day (07/04/22)")
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