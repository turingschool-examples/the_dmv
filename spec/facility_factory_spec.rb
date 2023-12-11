require 'spec_helper'

RSpec.describe FacilityFactory do 
    it 'exists' do
        factory = FacilityFactory.new
        expect(factory).to be_an_instance_of(FacilityFactory)
    end

    it 'can create a facility' do
        factory = FacilityFactory.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        expect(factory.create_facilitys(co_dmv_office_locations)).to be_an Array


    end 
end 