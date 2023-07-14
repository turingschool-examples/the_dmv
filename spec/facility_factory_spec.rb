require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory_1 = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@factory_1).to be_an_instance_of(FacilityFactory)
      @factory_1.create_factory(@co_dmv_office_locations)
      expect(@factory_1.create_factory(@co_dmv_office_locations)).to be_an Array
      expect(@factory_1.create_factory(@co_dmv_office_locations)).to all be_a Facility
    end
  end
end