require "./lib/facility.rb"
require "./lib/facility_list.rb"
require "./lib/dmv_data_service.rb"

describe FacilityList do
    it "exists" do
        factory = FacilityList.new

        expect(factory).to be_a FacilityList
    end

    it "creates facilities with CO API data" do
        list = FacilityList.new
        co_facilities_data = DmvDataService.new.co_dmv_office_locations
        list.parse_facilities(co_facilities_data)

        expect(list.facilities.first).to be_a(Facility)
        expect(list.facilities.first.name).not_to be_nil
        expect(list.facilities.first.address).not_to be_nil
        expect(list.facilities.first.phone).not_to be_nil
        expect(list.facilities.first.services).not_to be_nil
        expect(list.facilities.first.hours).not_to be_nil
    end

    it "creates facilities with NY API data" do
        list = FacilityList.new
        new_york_facilities_data = DmvDataService.new.ny_dmv_office_locations
        list.parse_facilities(new_york_facilities_data)

        expect(list.facilities.first).to be_a(Facility)
        expect(list.facilities.first.name).not_to be_nil
        expect(list.facilities.first.address).not_to be_nil
        expect(list.facilities.first.phone).not_to be_nil
        expect(list.facilities.first.services).not_to be_nil
        expect(list.facilities.first.hours).not_to be_nil

        require 'pry'; binding.pry
    end

    it "creates facilities with MO API data" do
        list = FacilityList.new
        missouri_facilities_data = DmvDataService.new.mo_dmv_office_locations        
        list.parse_facilities(missouri_facilities_data)

        expect(list.facilities.first).to be_a(Facility)
        expect(list.facilities.first.name).not_to be_nil
        expect(list.facilities.first.address).not_to be_nil
        expect(list.facilities.first.phone).not_to be_nil
        expect(list.facilities.first.services).not_to be_nil
        expect(list.facilities.first.hours).not_to be_nil
    end
end