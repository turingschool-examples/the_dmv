require 'spec_helper'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe FacilityFactory do

    it 'exists' do
        factory = FacilityFactory.new

        expect(factory).to be_an_instance_of(FacilityFactory)
    end

    it 'can take a Colorado DMV info from an API and format it for our needs' do
        factory = FacilityFactory.new
        co_dmvs = DmvDataService.new.co_dmv_office_locations

        expect(factory.create_co_facility(co_dmvs)).to be_an_instance_of(Array)
    end

    it 'can take a New York DMV info from an API and format it for our needs' do
        factory = FacilityFactory.new
        ny_dmvs = DmvDataService.new.ny_dmv_office_locations

        expect(factory.create_ny_facility(ny_dmvs)).to be_an_instance_of(Array)
    end

    it 'can take a Missouri DMV info from an API and format it for our needs' do
        factory = FacilityFactory.new
        mo_dmvs = DmvDataService.new.mo_dmv_office_locations

        expect(factory.create_mo_facility(mo_dmvs)).to be_an_instance_of(Array)
        binding.pry
    end
end