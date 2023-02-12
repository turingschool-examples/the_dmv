require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv = DmvDataService.new.or_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a FacilityFactory
    end
  end
end
