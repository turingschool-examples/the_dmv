require 'spec_helper'

RSpec.describe 'Facility Constructor' do
  describe 'exists' do
    it '#is an instance of' do
      facility = FacilityConstructor.new
      expect(facility).to be_a(FacilityConstructor)
    end
  end

  describe 'accesses the API' do
    it '#create facilities' do
      facility = FacilityConstructor.new
      dmv_office_location = DmvDataService.new.or_dmv_office_locations
      created_facilities = facility.create_facility(dmv_office_location)
      expect(created_facilities).to be_a(Array)
      expect(created_facilities.first).to be_a(Facility)
      expect(created_facilities.length).to eq(59)
    end
  end
end