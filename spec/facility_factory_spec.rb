require 'spec_helper'

describe FacilityFactory do
    before do
        @facility_factory = FacilityFactory.new
    end

    it 'is an instance of FacilityFactory' do
       expect(@facility_factory).to be_a(FacilityFactory)
    end

    it 'creates CO facility objects from api data' do
       co_facility_locations = DmvDataService.new.co_dmv_office_locations
       co_facilities = @facility_factory.create_facilities(co_facility_locations)
       co_facility_1 = co_facilities.first

       expect(co_facilities).to be_an(Array)
       expect(co_facility_1.name).to eq("DMV Tremont Branch")
       expect(co_facility_1.phone).to eq("(720) 865-4600")
    end
end
