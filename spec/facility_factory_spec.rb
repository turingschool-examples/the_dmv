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
      
      expect(or_facilities[0].name).to eq("Albany DMV Office")
      expect(or_facilities[1].name).to eq("Ashland DMV Office")
      expect(or_facilities[2].name).to eq("Astoria DMV Office")
      expect(or_facilities[5].name).to eq("Bend DMV Office")
      expect(or_facilities[10].name).to eq("Condon DMV Office")
    end
    it 'creates new facilities from NY' do
      facility = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      # ny_facilities = facility.create_facility(new_york_facilities)
    end

    it 'creates new facilities from MO' do 
      facility = FacilityFactory.new
      missouri_facilities = missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      
      # require 'pry'; binding.pry
    end
  end
end