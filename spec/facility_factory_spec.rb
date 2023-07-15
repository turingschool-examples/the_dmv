require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end
  describe 'initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end
  
  describe '#create_facility' do
    it 'returns facilities from the factory' do
      expect(@factory.create_facilities(@co_dmv_office_locations)).to all be_a(Facility)
    end
  end
end