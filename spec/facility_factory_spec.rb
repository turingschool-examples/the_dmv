require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    end

    describe 'loads data' do
        it 'loads CO DMV data' do
            expect(@co_dmv_office_locations).to be_an_instance_of(Array)
        end
    end

    describe '#initialize' do
        it 'exists' do
            expect(@factory).to be_an_instance_of(FacilityFactory)
        end
    end

    describe '#create_facilities' do
        it 'can use data to create new CO DMV Facility instances' do
            facilities = @factory.create_facilities(@co_dmv_office_locations)
            expect(facilities).to be_an_instance_of(Array)
            expect(facilities.size).to be_an(Integer)
            expect(facilities.first).to be_an_instance_of(Facility)
            expect(facilities.last).to be_an_instance_of(Facility)
        end

        it 'creates proper name for the CO DMV Facility instances' do
            facilities = @factory.create_facilities(@co_dmv_office_locations)
            expect(facilities.first.name).not_to eq(nil)
            expect(facilities.first.name).to be_a(String)
        end

        it 'creates proper address for the CO DMV Facility instances' do
            facilities = @factory.create_facilities(@co_dmv_office_locations)
            expect(facilities.first.address).not_to eq(nil)
            expect(facilities.first.address).to be_a(String)
        end

        it 'creates proper phone number for the CO DMV Facility instances' do
            facilities = @factory.create_facilities(@co_dmv_office_locations)
            expect(facilities.first.phone).not_to eq(nil)
            expect(facilities.first.phone).to be_a(String)
        end
    end
end