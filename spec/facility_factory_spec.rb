require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  end
  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end

end