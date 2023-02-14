require 'spec_helper'

RSpec.describe Dmv do
    before(:each) do
        @location = DmvFacility.new
        @dmv_facility = DmvFacility.new
        @or_facility = DmvDataService.new.or_dmv_office_locations
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
            @created_facilities = @dmv_facility.create_facilities_or(@or_facility)
            expect(@or_facility[0].name).to eq(facility_1.name)
            expect(@or_facility[1].name).to eq(facility_2.name)
            expect(@or_facility[0].address).to eq(facility_1.address)
            expect(@or_facility[1].address).to eq(facility_2.address)
            expect(@or_facility[0].phone).to eq(facility_1.phone)
            expect(@or_facility[1].phone).to eq(facility_2.phone)
        end
    end
end