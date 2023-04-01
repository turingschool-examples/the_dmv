require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    @oregon_facilities = FacilityFactory.new.create_facility_oregon(@or_dmv_office_locations)
  end

  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facility_oregon' do
    it 'can create facilities from the Oregon DMV office data' do
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
  
end