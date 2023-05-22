require 'spec_helper'

RSpec.describe FacilityLocations do
  before(:each) do
    @locations = FacilityLocations.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end
  
  describe '#initialize' do
    it 'can initialize' do
      expect(@locations).to be_an_instance_of(FacilityLocations)
    end
  end
  
  describe '#generate_location_data' do
    it 'can fetch or_dmv_office_locations' do
      expect(@or_dmv_office_locations).to be_an(Array)
      expect(@or_dmv_office_locations.size).to eq(59)
      expect(@or_dmv_office_locations[0][:"title"]).to eq("Albany DMV Office")
    end
    
    it 'can create facilities' do
      or_facilities = @locations.create_facilities(@or_dmv_office_locations)
      expect(or_facilities.first.name).to eq("Albany DMV Office")
      expect(or_facilities.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(or_facilities.first.phone).to eq("541-967-2014")
      expect(or_facilities.first.services).to eq([])
      expect(or_facilities.first.registered_vehicles).to eq([])
      expect(or_facilities.first.collected_fees).to eq(0)

      expect(or_facilities[39].name).to eq("Oakridge DMV Office")
      expect(or_facilities[39].address).to eq("47660 Highway 58 Oakridge OR 97463")
      expect(or_facilities[39].phone).to eq("541-889-8712")
      expect(or_facilities[39].services).to eq([])
      expect(or_facilities[39].registered_vehicles).to eq([])
      expect(or_facilities[39].collected_fees).to eq(0)
    end
  end

  describe '#generate_second_location_data' do
    it 'can fetch or_dmv_office_locations' do
      expect(@ny_dmv_office_locations).to be_an(Array)
      expect(@ny_dmv_office_locations.size).to eq(172)
      expect(@ny_dmv_office_locations[0][:"office_name"]).to eq("JAMAICA KIOSK")
    end
    
    xit 'can create facilities from second data set' do
      or_facilities = @locations.create_facilities(@or_dmv_office_locations)
      expect(or_facilities.first.name).to eq("Albany DMV Office")
      expect(or_facilities.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(or_facilities.first.phone).to eq("541-967-2014")
      expect(or_facilities.first.services).to eq([])
      expect(or_facilities.first.registered_vehicles).to eq([])
      expect(or_facilities.first.collected_fees).to eq(0)

      # expect(or_facilities[39].name).to eq("Oakridge DMV Office")
      # expect(or_facilities[39].address).to eq("47660 Highway 58 Oakridge OR 97463")
      # expect(or_facilities[39].phone).to eq("541-889-8712")
      # expect(or_facilities[39].services).to eq([])
      # expect(or_facilities[39].registered_vehicles).to eq([])
      # expect(or_facilities[39].collected_fees).to eq(0)
    end
  end

end