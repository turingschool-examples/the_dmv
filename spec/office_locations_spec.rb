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
    end

DmvDataService.new.co_dmv_office_locations
end