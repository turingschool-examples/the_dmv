require 'spec_helper'

RSpec.describe do FacilityFactory
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end
end