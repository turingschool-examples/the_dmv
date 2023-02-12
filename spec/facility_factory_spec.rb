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

  describe '#create_facilities' do
    it 'can create multiple facility objects' do
      facilities = @factory.create_facilities(@or_dmv)
      expect(facilities).to be_a Array
      expect(facilities.first).to be_a Facility
      expect(facilities.last).to be_a Facility
      expect(facilities.sample).to be_a Facility
    end

    it 'can create facility objects for all facilities in data set' do
      facilities = @factory.create_facilities(@or_dmv)

      expect(facilities.count).to eq(@or_dmv.count)
    end

    it 'can add attributes to the facility objects' do
      facilities = @factory.create_facilities(@or_dmv)

      expect(facilities.sample.name).to be_a String
      expect(facilities.sample.address).to be_a String
      expect(facilities.sample.phone).to be_a String
      expect(facilities.sample.services).to eq([])
      expect(facilities.sample.registered_vehicles).to eq([])
      expect(facilities.sample.collected_fees).to eq(0)
    end
  end
end
