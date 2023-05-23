require 'spec_helper'

RSpec.describe DMVfacility do
    describe '#create_facility' do
        it 'can create facility' do
            facilities = DMVfacility.new
            oregon_facilities = DmvDataService.new.or_dmv_office_locations
            new_york_facilities = DmvDataService.new.ny_dmv_office_locations
            missouri_facilities = DmvDataService.new.mo_dmv_office_locations
            
            OR = facilities.create_facility(oregon_facilities)
            expect(OR[0].name).to eq("Albany DMV Office")
            expect(OR[0].address).to eq("2242 Santiam Hwy SE Albany OR 97321")
            expect(OR[0].phone).to eq("541-967-2014")

            NY = facilities.create_facility(new_york_facilities)
            expect(NY[0].name).to eq("JAMAICA KIOSK")
            expect(NY[0].address).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
            expect(NY[1].phone).to eq("5857531604")

            MO = facilities.create_facility(missouri_facilities)
            expect(MO[0].name).to eq("OAKVILLE")
            expect(MO[0].address).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
            expect(MO[0].phone).to eq("(314) 887-1050")
        end
    end
end
