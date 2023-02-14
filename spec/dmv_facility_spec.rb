require 'spec_helper'

RSpec.describe Dmv do
    before(:each) do
        @location = DmvFacility.new
        @dmv_facility = DmvFacility.new
        @or_facility = DmvDataService.new.or_dmv_office_locations
        @ny_facility = DmvDataService.new.ny_dmv_office_locations
    end

    describe '#initialize' do
        it 'initializes' do
          expect(@location).to be_an_instance_of(DmvFacility) 
        end
    end

    describe '@create facilities' do
        it 'can create facilities' do
            @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
            @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
            @created_facilities = @location.create_facilities_or(@or_facility)
            expect(@created_facilities[0].name).to eq(@facility_1.name)
            expect(@created_facilities[1].name).to eq(@facility_2.name)
            expect(@created_facilities[0].address).to eq(@facility_1.address)
            expect(@created_facilities[1].address).to eq(@facility_2.address)
            expect(@created_facilities[0].phone).to eq(@facility_1.phone)
            expect(@created_facilities[1].phone).to eq(@facility_2.phone)
        end
    end

    describe '@create facilities ny' do
        it 'can create facilities for ny' do
            @facility_1 = Facility.new({name: 'JAMESTOWN', address: '512 WEST 3RD STREET JAMESTOWN NY 14701', phone: '7166618220' })
            @facility_2 = Facility.new({name: 'SARATOGA SPRINGS - WILTON', address: '3065 ROUTE 50 SARATOGA SPRINGS NY 12866', phone: '5185847403' })
            @created_facilities_ny = @location.create_facilities_ny(@ny_facility)
            expect(@created_facilities_ny[0].name).to eq(@facility_1.name)
            expect(@created_facilities_ny[1].name).to eq(@facility_2.name)
            expect(@created_facilities_ny[0].address).to eq(@facility_1.address)
            expect(@created_facilities_ny[1].address).to eq(@facility_2.address)
            expect(@created_facilities_ny[0].phone).to eq(@facility_1.phone)
            expect(@created_facilities_ny[1].phone).to eq(@facility_2.phone)
        end
    end
end

# {"office_name":"JAMESTOWN","office_type":"COUNTY OFFICE","public_phone_number":"7166618220","street_address_line_1":"512 WEST 3RD STREET","city":"JAMESTOWN","state":"NY","zip_code":"14701","monday_beginning_hours":"8:30 AM","monday_ending_hours":"4:15 PM","tuesday_beginning_hours":"8:30 AM","tuesday_ending_hours":"4:15 PM","wednesday_beginning_hours":"8:30 AM","wednesday_ending_hours":"4:15 PM","thursday_beginning_hours":"8:30 AM","thursday_ending_hours":"5:45 PM","friday_beginning_hours":"8:30 AM","friday_ending_hours":"4:15 PM","georeference":{"type":"Point","coordinates":[-79.24796,42.09526]},":@computed_region_yamh_8v7k":"209",":@computed_region_wbg7_3whc":"1687",":@computed_region_kjdx_g34t":"2035"}
# ,{"office_name":"SARATOGA SPRINGS - WILTON","office_type":"COUNTY OFFICE","public_phone_number":"5185847403","street_address_line_1":"3065 ROUTE 50","street_address_line_2":"WILTON MALL","city":"SARATOGA SPRINGS","state":"NY","zip_code":"12866","monday_beginning_hours":"9:15 AM","monday_ending_hours":"4:45 PM","tuesday_beginning_hours":"9:15 AM","tuesday_ending_hours":"4:45 PM","wednesday_beginning_hours":"9:15 AM","wednesday_ending_hours":"4:45 PM","thursday_beginning_hours":"9:15 AM","thursday_ending_hours":"4:45 PM","friday_beginning_hours":"9:15 AM","friday_ending_hours":"4:45 PM","georeference":{"type":"Point","coordinates":[-73.74138,43.10429]},":@computed_region_yamh_8v7k":"991",":@computed_region_wbg7_3whc":"147",":@computed_region_kjdx_g34t":"2141"}