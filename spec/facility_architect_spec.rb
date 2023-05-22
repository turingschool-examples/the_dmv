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
  end
end