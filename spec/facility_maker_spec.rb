require 'spec_helper'

RSpec.describe FacilityMaker do
    describe '#create_facility.first(facility_data)' do
        it 'creates a facility object' do
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facility_maker = FacilityMaker(co_dmv_office_locations)

        expect(facility_maker).to be_a(Facility)
        end

        it 'stores data when initialized' do
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facility_maker = FacilityMaker(co_dmv_office_locations)

        expect(facility.first[:name]).not_to eq(nil)
        expect(facility.first[:address]).not_to eq(nil)
        expect(facility.first[:phone]).not_to eq(nil)
        expect(facility.first.services).not_to eq([])
        expect(facility.first.registered_vehicles).to eq([])
        expect(facility.first.collected_fees).to eq(0)
        expect(facility.last[:name]).not_to eq(nil)
        expect(facility.last[:address]).not_to eq(nil)
        expect(facility.last[:phone]).not_to eq(nil)
        expect(facility.last.services).not_to eq([])
        expect(facility.last.registered_vehicles).to eq([])
        expect(facility.last.collected_fees).to eq(0)
        end
    end