require './lib/facility_factory'
require './lib/facility'
require './lib/DmvDataService'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
        @ny_facilities = DmvDataService.new.ny_dmv_office_locations
        @co_facilities = DmvDataService.new.co_dmv_office_locations
        @mo_facilities = DmvDataService.new.mo_dmv_office_locations
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(FacilityFactory)
    end

    it 'shows where ny locations are' do
        expect(@factory.pull_facilities(@ny_facilities)).to eq()








end