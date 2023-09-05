require 'spec_helper'

RSpec.describe FacilityCreator do
  describe '#initialize' do
    it 'exists' do
      creator = FacilityCreator.new
      expect(creator).to be_a(FacilityCreator)
    end
  end

  describe '#Accessing API' do
    it 'connects to API' do
      creator = FacilityCreator.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      expect(co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations).to be_a(Array)
    end

    it 'returns CO facilities' do
      creator = FacilityCreator.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_facilities = creator.create_co_facilities(co_dmv_office_locations)
      expect(new_facilities).to be_a(Array)
      expect(new_facilities).to all be_a(Facility)
    end
  end

  describe '#multiple data sources' do
    it 'returns NY facilities' do
      creator = FacilityCreator.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      new_facilities = creator.create_ny_facilities(new_york_facilities)
      expect(new_facilities).to be_a(Array)
      expect(new_facilities).to all be_a(Facility)
    end
    
    it 'returns MO facilities' do
      creator = FacilityCreator.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      new_facilities = creator.create_mo_facilities(missouri_facilities)
      expect(new_facilities).to be_a(Array)
      expect(new_facilities).to all be_a(Facility)
    end
  end
end