require 'rspec'
require './lib/facility_factor'
require './lib/facility'
require './lib/dmv'

RSpec.describe FacilityFactory do
    before(:each) do
        @facility = FacilityFactory.new
        co_facilities = DmvDataService.new.co_dmv_office_locations
    end

    describe '#initialize' do
      it 'can initialize' do
        expect(@facility).to be_an_instance_of(FacilityFactory)
      end
    end

    describe '#create_facilities' do
      it 'can create facilities' do
        @facility.create_facilities(co_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.name).to eq("DMV Tremont Branch")
        expect(@facility.facility_list.address).to eq("2855 Tremont Place, Suite 118, Denver, CO 80205")
        expect(@facility.facility_list.phone).to eq("(720) 865-4600")
      end
    end
end