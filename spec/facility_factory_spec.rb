require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a FacilityFactory
    end
  end

  describe '#create_facilities' do
    before(:each) do
      @oregon = @factory.create_facilities(@oregon_facilities)
      @new_york = @factory.create_facilities(@new_york_facilities)
    end

    it 'can create multiple facility objects' do
      expect(@oregon).to be_a Array
      expect(@oregon.first).to be_a Facility
      expect(@oregon.last).to be_a Facility
      expect(@oregon.sample).to be_a Facility

      expect(@new_york).to be_a Array
      expect(@new_york.first).to be_a Facility
      expect(@new_york.last).to be_a Facility
      expect(@new_york.sample).to be_a Facility
    end

    it 'can create facility objects for all facilities in data set' do
      expect(@oregon.count).to eq(@oregon_facilities.count)
      expect(@new_york.count).to eq(@new_york_facilities.count)
    end

    it 'can add attributes to the facility objects' do
      expect(@oregon.sample.name).to be_a String
      expect(@oregon.sample.address).to be_a String
      expect(@oregon.sample.phone).to be_a String
      expect(@oregon.sample.services).to eq([])
      expect(@oregon.sample.registered_vehicles).to eq([])
      expect(@oregon.sample.collected_fees).to eq(0)

      expect(@new_york.sample.name).to be_a String
      expect(@new_york.sample.address).to be_a String
      expect(@new_york.sample.phone).to be_a String
      expect(@new_york.sample.services).to eq([])
      expect(@new_york.sample.registered_vehicles).to eq([])
      expect(@new_york.sample.collected_fees).to eq(0)
    end
  end
end
