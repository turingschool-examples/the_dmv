require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @facility = FacilityFactory.new
    end

    describe '#initialize' do
      it 'can initialize' do
        expect(@facility).to be_an_instance_of(FacilityFactory)
      end
    end

    describe '#create_facilities' do
      it 'can create facilities' do
        co_facilities = DmvDataService.new.co_dmv_office_locations
        @facility.create_facilities(co_facilities)

        #require 'pry';binding.pry
        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.first.name).to eq(["DMV Tremont Branch"])
        expect(@facility.facility_list.first.address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
        expect(@facility.facility_list.first.phone).to eq(["(720) 865-4600"])
      end
    end
end