require 'spec_helper'

RSpec.describe DMVfacility do
    describe '#create_facility' do
        it 'can create facility' do
            facilities = DMVfacility.new
            oregon_facilities = DmvDataService.new.or_dmv_office_locations
            new_york_facilities = DmvDataService.new.ny_dmv_office_locations
            OR = facilities.create_facility(oregon_facilities)

            expect(OR[:name]).to eq("Albany DMV Office")
            expect(OR[:address]).to eq("2242 Santiam Hwy SE Albany OR 97321")
            



        end
    end
end