require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @fac_factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    @first_fac = @fac_factory.facilities[0]
  end

  describe '#initialize' do 
    it 'can initialize with attributes' do 
      expect(@fac_factory).to be_a(FacilityFactory)
      expect(@fac_factory.facilities).to eq([])
    end
  end

  describe '#add_oregon_source' do
    it 'it normalizes incoming oregon data' do
      @fac_factory.add_oregon_source(@or_dmv_office_locations)
     
      expect(@first_fac).to be_a(Hash)
      expect(@first_fac[:name]).not_to be nil
      expect(@first_fac[:address]).not_to be nil
      expect(@first_fac[:phone]).not_to be nil
    end
  end

  describe '#add_ny_source' do 
    it 'normalizes incoming NY data' do 
      @fac_factory.add_oregon_source(@ny_dmv_office_locations)
     
      expect(@first_fac).to be_a(Hash)
      expect(@first_fac[:name]).not_to be nil
      expect(@first_fac[:address]).not_to be nil
      expect(@first_fac[:phone]).not_to be nil
    end

  describe '#add_mo_source' do 
    it 'can create hashes of facility data' do 
      expect(@fac_factory.create_facilities(@mo_dmv_office_locations)).to be_a(Array)
      expect(@fac_factory.facilities.length).not_to eq(0)
    end
  end

  describe '#create_facilities' do 
    it 'can create facility objects with attributes' do 
      @fac_factory.add_oregon_source(@or_dmv_office_locations)
      @fac_factory.create_facilities2
     
      expect(@first_fac).to be_a(Facility)
      expect(@first_fac.name).not_to be nil
      expect(@first_fac.address).not_to be nil
      expect(@first_fac.phone).not_to be nil
      expect(@first_fac.services).to eq([])
      expect(@first_fac.registered_vehicles).to eq([])
      expect(@first_fac.collected_fees).to eq(0)
    end

    it 'adds new facilities to facilities attribute' do 
      @fac_factory.add_oregon_source(@or_dmv_office_locations)
      @fac_factory.create_facilities2

      expect(@fac_factory.facilities).to be_a(Array)
      expect(@fac_factory.facilities.length).not_to eq(0)
    end

    xit 'runs with any of the three above data sources' do 
      @fac_factory.add_oregon_source(@or_dmv_office_locations)
      @fac_factory.add_oregon_source(@ny_dmv_office_locations)
      @fac_factory.add_oregon_source(@mo_dmv_office_locations)
      @fac_factory.create_facilities2

      expect(@first_fac).to be_a(Facility)
      expect(@first_fac.name).not_to be nil
      expect(@first_fac.address).not_to be nil
      expect(@first_fac.phone).not_to be nil
      expect(@first_fac.services).to eq([])
      expect(@first_fac.registered_vehicles).to eq([])
      expect(@first_fac.collected_fees).to eq(0)
    end
end