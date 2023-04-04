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

  describe '#create OR Facility' do
    it 'can create OR facility object' do
      expect(@factory.facilities).to eq([])
      @factory.create_facilities(@oregon_facilities)
      expect(@factory.facilities.first).to be_an_instance_of(Facility)
    end

  end




end