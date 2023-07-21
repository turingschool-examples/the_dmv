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
        expect(@facility.facility_list.first.hours).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
        expect(@facility.facility_list.first.holidays).to eq("Not Available")
      end

      it 'can create new_york_facilities' do
        ny_facilities = DmvDataService.new.ny_dmv_office_locations
        @facility.create_facilities(ny_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.first.name).to eq("DISTRICT OFFICE")
        expect(@facility.facility_list.first.address).to eq("168-46 91ST AVE., 2ND FLR")
        expect(@facility.facility_list.first.phone).to eq("7189666155")
        expect(@facility.facility_list.first.hours).to eq("Monday-Friday 7:30 AM to 5:00 PM")
        expect(@facility.facility_list.first.holidays).to eq("Not Available")
      end

      it 'can create missouri_facilities' do
        mo_facilities = DmvDataService.new.mo_dmv_office_locations
        @facility.create_facilities(mo_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to be_an Array
        expect(@facility.facility_list.first.name).to eq("STODDARD COUNTY LICENSE OFFICE")
        expect(@facility.facility_list.first.address).to eq("119 VINE ST")
        expect(@facility.facility_list.first.phone).to eq("(573) 624-8808")
        expect(@facility.facility_list.first.hours).to eq("Monday - Friday - 8:30 to 4:30")
        expect(@facility.facility_list.first.holidays).to eq("Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
      end
    end
end