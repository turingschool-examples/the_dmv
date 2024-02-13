require './lib/facility_factory'
require './lib/facility'
require './lib/dmv_data_service'

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

    it 'shows ny location data' do
        expect(@factory.pull_facilities(@ny_facilities)).to be_an(Array)
    end

    it 'shows co location data' do 
        expect(@factory.pull_facilities(@co_facilities)).to be_an(Array)
    end

    it 'shows mo location data' do
        expect(@factory.pull_facilities(@mo_facilities)).to be_an(Array)
    end
end