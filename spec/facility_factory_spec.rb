require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory_1 = FacilityFactory.new
    @colorado_facilities = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory_1).to be_an_instance_of(FacilityFactory)
      @factory_1.create_factory(@colorado_facilities)
      expect(@factory_1.create_factory(@colorado_facilities)).to be_an Array
      expect(@factory_1.create_factory(@colorado_facilities)).to all be_a Facility
      @factory_1.create_factory(@new_york_facilities)
      require 'pry';binding.pry
      expect(@factory_1.create_factory(@new_york_facilities)).to be_an Array
      expect(@factory_1.create_factory(@new_york_facilities)).to all be_a Facility
      @factory_1.create_factory(@missouri_facilities)
      expect(@factory_1.create_factory(@missouri_facilities)).to be_an Array
      expect(@factory_1.create_factory(@missouri_facilities)).to all be_a Facility
    end
  end
end
