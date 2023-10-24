require "./lib/facility.rb"
require "./lib/facility_list.rb"
require "./lib/dmv_data_service.rb"

describe FacilityList do
    it "exists" do
        factory = FacilityList.new

        expect(factory).to be_a FacilityList
    end

    it "creates facilities with API data" do
        list = FacilityList.new
        co_facilities_data = DmvDataService.new.co_dmv_office_locations
        list.parse_facilities(co_facilities_data)

        expect(list.facilities.first).to be_a(Facility)
    end
end