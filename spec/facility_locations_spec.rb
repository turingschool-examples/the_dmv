require 'spec_helper'

RSpec.describe FacilityLocations do
  before(:each) do
    @locations = FacilityLocations.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  end
  
  describe '#initialize' do
    it 'can initialize' do
      expect(@locations).to be_an_instance_of(FacilityLocations)
    end
  end
  
  describe '#generate_adresses' do
    it 'can fetch or_dmv_office_locations' do
      expect(@or_dmv_office_locations).to be_an(Array)
      expect(@or_dmv_office_locations.size).to eq(59)
      expect(@or_dmv_office_locations[0][:"title"]).to eq("Albany DMV Office")
    end
    
    it 'can create vehicles from data' do
      or_facilities = @locations.create_vehicles(@or_dmv_office_locations)
      expect(or_facilities.first.name).to eq("Albany DMV Office")
      #expect(or_facilities.first.address).to eq("2022")
      expect(or_facilities.first.phone).to eq("541-967-2014")
      expect(or_facilities.first.services).to eq([])
      expect(or_facilities.first.registered_vehicles).to eq([])
      expect(or_facilities.first.collected_fees).to eq(0)
    end

  end

end