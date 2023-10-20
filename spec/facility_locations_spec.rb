require 'spec_helper'

RSpec.describe FacilityLocations do
  before(:each) do
    @facility = FacilityLocations.new
  end
  
  describe '#intialize' do
    it 'can intialize' do
      expect(@facility).to be_an_instance_of(FacilityLocations)
    end
  end

  describe '#Creating Objects from Multiple Data Sets & Analyzing Data' do
    it 'can create facilities from external data sources' do
      colorado = DmvDataService.new.co_dmv_office_locations
      co_offices = FacilityLocations.new
      co_offices.create_facilities(colorado)

      expect(co_offices.facilities).to include(Facility)
      expect(co_offices.facilities.length).to be > 1
    end

    it 'can create facilities from multiple data sources' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      ny_offices = FacilityLocations.new
      ny_offices.create_facilities(new_york_facilities)
  
      expect(ny_offices.facilities).to include(Facility)
      expect(ny_offices.facilities.length).to be > 1

      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      mo_offices = FacilityLocations.new
      mo_offices.create_facilities(new_york_facilities)
  
      expect(mo_offices.facilities).to include(Facility)
      expect(mo_offices.facilities.length).to be > 1

    end
  end

end