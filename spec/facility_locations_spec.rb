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
      expect(@or_dmv_office_locations[0][:title]).to eq("Albany DMV Office")
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

    it 'can integrate location_2 data' do
      or_facilities = @locations.create_facilities(@or_dmv_office_locations)
      expect(or_facilities[3].name).to eq("Baker City DMV Office")
      expect(or_facilities[3].address).to eq("3370 10th St Suite A Baker City OR 97814")
      expect(or_facilities[3].phone).to eq("541-523-4355")
      expect(or_facilities[3].services).to eq([])
      expect(or_facilities[3].registered_vehicles).to eq([])
      expect(or_facilities[3].collected_fees).to eq(0)
    end
  end

  describe '#generate_second_location_data' do
    it 'can fetch or_dmv_office_locations' do
      expect(@ny_dmv_office_locations).to be_an(Array)
      expect(@ny_dmv_office_locations.size).to eq(172)
      expect(@ny_dmv_office_locations[0][:office_name]).to eq("JAMAICA KIOSK")
    end
    
    it 'can create facilities from second data set' do
      ny_facilities = @locations.create_facilities(@ny_dmv_office_locations)
      expect(ny_facilities.first.name).to eq("JAMAICA KIOSK")
      expect(ny_facilities.first.address).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
      expect(ny_facilities.first.phone).to eq("N/A")
      expect(ny_facilities.first.services).to eq([])
      expect(ny_facilities.first.registered_vehicles).to eq([])
      expect(ny_facilities.first.collected_fees).to eq(0)

      expect(ny_facilities[125].name).to eq("POUGHKEEPSIE")
      expect(ny_facilities[125].address).to eq("22 MARKET STREET COUNTY OFFICE BUILDING POUGHKEEPSIE NY 12601")
      expect(ny_facilities[125].phone).to eq("N/A")
      expect(ny_facilities[125].services).to eq([])
      expect(ny_facilities[125].registered_vehicles).to eq([])
      expect(ny_facilities[125].collected_fees).to eq(0)
    end
  end

  describe '#generate_third_location_data' do
    it 'can fetch mo_dmv_office_locations' do
      expect(@mo_dmv_office_locations).to be_an(Array)
      expect(@mo_dmv_office_locations.size).to eq(178)
      expect(@mo_dmv_office_locations[0][:name]).to eq("OAKVILLE")
    end
    
    it 'can create facilities from second data set' do
      mo_facilities = @locations.create_facilities(@mo_dmv_office_locations)
      expect(mo_facilities.first.name).to eq("OAKVILLE")
      expect(mo_facilities.first.address).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
      expect(mo_facilities.first.phone).to eq("314-887-1050")
      expect(mo_facilities.first.services).to eq([])
      expect(mo_facilities.first.registered_vehicles).to eq([])
      expect(mo_facilities.first.collected_fees).to eq(0)

      expect(mo_facilities[108].name).to eq("MALDEN")
      expect(mo_facilities[108].address).to eq("1112 N Douglass MALDEN MO 63863")
      expect(mo_facilities[108].phone).to eq("573-276-5006")
      expect(mo_facilities[108].services).to eq([])
      expect(mo_facilities[108].registered_vehicles).to eq([])
      expect(mo_facilities[108].collected_fees).to eq(0)
    end
  end

end