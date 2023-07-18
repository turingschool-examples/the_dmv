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
      it 'can create co_facilities' do
        co_facilities = DmvDataService.new.co_dmv_office_locations
        @facility.create_facilities(co_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.first.name).to eq("DMV Tremont Branch")
        expect(@facility.facility_list.first.address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
        expect(@facility.facility_list.first.phone).to eq("(720) 865-4600")
      end

      it 'can create new_york_facilities' do
        ny_facilities = DmvDataService.new.ny_dmv_office_locations
        @facility.create_facilities(ny_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.first.name).to eq("DISTRICT OFFICE")
        expect(@facility.facility_list.first.address).to eq("168-46 91ST AVE., 2ND FLR")
        expect(@facility.facility_list.first.phone).to eq("7189666155")
      end

      it 'can create missouri_facilities' do
        mo_facilities = DmvDataService.new.mo_dmv_office_locations
        @facility.create_facilities(mo_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.first.name).to eq("STODDARD COUNTY LICENSE OFFICE")
        expect(@facility.facility_list.first.address).to eq("119 VINE ST")
        expect(@facility.facility_list.first.phone).to eq("(573) 624-8808")
      end
    end
end