require 'spec_helper'

RSpec.describe FacilityArchitect do
  before(:each) do
    @facility_architect = FacilityArchitect.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  end

  describe 'Iteration 3' do
    it 'exists' do
      expect(@facility_architect).to be_a(FacilityArchitect)
      expect(@or_dmv_office_locations).to be_a(Array)
      expect(@or_dmv_office_locations.first).to be_a(Hash)
      expect(@or_dmv_office_locations.first[:phone_number]).to eq("541-967-2014")
      expect(@or_dmv_office_locations.first.dig(:location_1, :latitude)).to eq("44.632897")
    end

    it 'can design new facilities from API Call data' do
      or_facility = @facility_architect.design_facility(@or_dmv_office_locations)
      expect(or_facility).to be_a(Array)
      expect(or_facility.first).to be_a(Facility)
      expect(or_facility.first.name).to eq("Albany DMV Office")
      expect(or_facility.first.address).to be_a(Hash)
      # I'll get back to the address. Need to keep moving with the other locations
      expect(or_facility.first.phone).to eq("541-967-2014")
    end

    it 'has key adder method' do
      unformatted_keys = @or_dmv_office_locations[2]
      expect(unformatted_keys[:name]).to be_nil
      expect(unformatted_keys[:phone]).to be_nil
      expect(unformatted_keys[:address]).to be_nil
      
      facility_array = @facility_architect.facility_key_updater(unformatted_keys)
      
      expect(facility_array.first[:name]).to eq("Astoria DMV Office")
      expect(facility_array.first[:phone]).to eq("503-325-3951")
      expect(facility_array.first[:address]).to be_a(Hash)

    end
  end
end