require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    @oregon_facilities = FacilityFactory.new.create_facility_oregon(@or_dmv_office_locations)
    @new_york_facilities = FacilityFactory.new.create_facility_new_york(@ny_dmv_office_locations)
    @missouri_facilities = FacilityFactory.new.create_facility_missouri(@mo_dmv_office_locations)
  end

  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facility_oregon' do
    it 'can create facilities from Oregon DMV office data' do
      expect(@oregon_facilities).to be_a(Array)
      expect(@oregon_facilities.count).to eq(59)
    end

    it 'can find the name of DMV offices in Oregon' do
      expect(@oregon_facilities[0].name).to eq("Albany DMV Office")
      expect(@oregon_facilities[@oregon_facilities.count - 1].name).to eq("La Pine DMV Office")
    end

    it 'can find the phone number of DMV offices in Oregon' do
      expect(@oregon_facilities[0].phone).to eq("541-967-2014")
      expect(@oregon_facilities[@oregon_facilities.count - 1].phone).to eq("541-388-6322")
    end
    
    it 'can find the address of DMV offices in Oregon' do
      expect(@oregon_facilities[0].address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@oregon_facilities[@oregon_facilities.count - 1].address).to eq("51515 Huntington Rd La Pine OR 97739")
    end
  end

  describe '#create_facility_new_york' do
    it 'can create facilities from New York DMV office data' do
      expect(@new_york_facilities).to be_a(Array)
      expect(@new_york_facilities.count).to eq(170)
    end

    it 'can find the name of DMV offices in New York' do
      expect(@new_york_facilities[0].name).to eq("SELDEN")
      expect(@new_york_facilities[@new_york_facilities.count - 1].name).to eq("MILLBROOK")
    end

    it 'can find the phone number of DMV offices in New York' do
      expect(@new_york_facilities[0].phone).to eq(nil)
      expect(@new_york_facilities[@new_york_facilities.count - 1].phone).to eq("8456774080")
    end

    it 'can find the address of DMV offices in New York' do
      expect(@new_york_facilities[0].address).to eq("407 SELDEN RD  SELDEN NY 11784")
      expect(@new_york_facilities[@new_york_facilities.count - 1].address).to eq("15 MERRITT AVENUE  MILLBROOK NY 12545")
    end
  end

  describe '#create_facility_missouri' do
    it 'can create facilities from Missouri DMV office data' do
      expect(@missouri_facilities).to be_a(Array)
      expect(@missouri_facilities.count).to eq(177)
    end

    it 'can find the name of DMV offices in Missouri' do
      expect(@missouri_facilities[0].name).to eq("OAKVILLE")
      expect(@missouri_facilities[@missouri_facilities.count - 1].name).to eq("BELTON")
    end

    it 'can find the phone number of DMV offices in Missouri' do
      expect(@missouri_facilities[0].phone).to eq("(314) 887-1050")
      expect(@missouri_facilities[@missouri_facilities.count - 1].phone).to eq("(816) 331-9400")
    end

    it 'can find the address of DMV offices in Missouri' do
      expect(@missouri_facilities[0].address).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
      expect(@missouri_facilities[@missouri_facilities.count - 1].address).to eq("325 MAIN STREET BELTON MO 64012")
    end
  end
  
end