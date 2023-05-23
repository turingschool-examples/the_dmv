require 'spec_helper'

RSpec.describe DMVfacility do
    describe '#create_facility' do
        it 'can create facility' do
            facilities = DMVfacility.new
            oregon_facilities = DmvDataService.new.or_dmv_office_locations
            new_york_facilities = DmvDataService.new.ny_dmv_office_locations
            OR = facilities.create_facility(oregon_facilities)

            expect(OR[0].name).to eq("Albany DMV Office")
            expect(OR[0].address).to eq("2242 Santiam Hwy SE Albany OR 97321")
            expect(OR[0].phone).to eq("541-967-2014")

        end
    end
end