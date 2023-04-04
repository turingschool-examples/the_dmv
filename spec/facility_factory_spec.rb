require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'Initialize' do
    it 'exists' do
      facility = FacilityFactory.new

      expect(facility).to be_a(FacilityFactory)
    end

    it 'creates new facilities from OR' do
      facility = FacilityFactory.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      or_facilities = facility.create_facility(or_dmv_office_locations)
      
      expect(or_facilities[0].name).to be_a String
      expect(or_facilities[1].address).to be_a String
      expect(or_facilities[2].phone).to be_a String
    end

    it 'creates new facilities from NY' do
      facility = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      ny_facilities = facility.create_facility(new_york_facilities)
      # require 'pry'; binding.pry
      expect(ny_facilities[0].name).to be_a String
      expect(ny_facilities[1].address).to be_a String
      expect(ny_facilities[2].phone).to be_a String
    end

    it 'creates new facilities from MO' do 
      facility = FacilityFactory.new
      missouri_facilities = missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      mo_facilities = facility.create_facility(missouri_facilities)
      
      expect(mo_facilities[0].name).to be_a String
      expect(mo_facilities[1].address).to be_a String
      expect(mo_facilities[2].phone).to be nil
      expect(mo_facilities[5].phone).to be_a String
    end
  end
  # Wasn't sure how to implement tests for helper methods, was running out of time as well.
end