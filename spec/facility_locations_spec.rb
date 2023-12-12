require 'spec_helper'

RSpec.describe FacilityLocations do
    it 'returns facility objects' do
        expect(DmvDataService.new.co_dmv_office_locations).to all(be_an_instance_of(Facility))
    end
end