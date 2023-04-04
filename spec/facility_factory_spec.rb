require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize facility objects' do
      expect(@factory).to be_a(FacilityFactory)
    end

  end

  describe '#create Facilities' do
    it 'can create OR facility object' do
      expect(@factory.facilities).to eq([])
      
      @factory.create_facilities(@oregon_facilities)

      expect(@factory.determine_name(@oregon_facilities.first)).to eq("Albany DMV Office")
      expect(@factory.determine_phone(@oregon_facilities.first)).to eq("541-967-2014")
    end
  end

end