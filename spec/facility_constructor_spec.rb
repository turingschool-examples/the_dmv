require 'spec_helper'

RSpec.describe 'Facility Constructor' do
  before(:each) do
    @facility = FacilityConstructor.new
    @dmv_office_location = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe 'exists' do
    it '#is an instance of' do
      expect(@facility).to be_a(FacilityConstructor)
    end
  end

  describe 'accesses the API to create facilities' do

    it '#create facilities' do
      created_facilities = @facility.create_facility(@dmv_office_location)

      expect(created_facilities).to be_a(Array)
      expect(created_facilities.first).to be_a(Facility)
      expect(created_facilities.length).to eq(59)
    end

    it '#create NY facility' do
      created_facilities = @facility.create_facility(@new_york_facilities)

      expect(created_facilities).to be_a(Array)
      expect(created_facilities.first).to be_a(Facility)
      expect(created_facilities.length).to eq(169)
    end
    
    it '#create MO facility' do
      created_facilities = @facility.create_facility(@missouri_facilities)

      expect(created_facilities).to be_a(Array)
      expect(created_facilities.first).to be_a(Facility)
      expect(created_facilities.length).to eq(178)
    end
  end
end