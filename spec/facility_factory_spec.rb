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

    it 'can take a DMV from an API and format it for our needs' do
        factory = FacilityFactory.new
        co_dmvs = DmvDataService.new.co_dmv_office_locations

        expect(factory.create_facility(co_dmvs)).to be_an_instance_of(Array)
    end
end