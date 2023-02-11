require 'spec_helper'

RSpec.describe 'Facility Constructor' do
  describe 'exists' do
    it '#is an instance of' do
      facility = FacilityConstructor.new
      expect(facility).to be_a(FacilityConstructor)
    end
  end

  describe 'accesses the API to create facilities' do
    before(:each) do
      @facility = FacilityConstructor.new
      
    end
    it '#create facilities' do
      dmv_office_location = DmvDataService.new.or_dmv_office_locations
      created_facilities = @facility.create_facility(dmv_office_location)
      expect(created_facilities).to be_a(Array)
      expect(created_facilities.first).to be_a(Facility)
      expect(created_facilities.length).to eq(59)
    end

    it '#create additional facilities' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      created_facilities = @facility.create_facility(new_york_facilities)
      expect(created_facilities).to be_a(Array)
      expect(created_facilities.first).to be_a(Facility)
      expect(created_facilities.length).to eq(169)
    end
  end
end