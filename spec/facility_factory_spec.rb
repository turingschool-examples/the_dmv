require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @fac_factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do 
    it 'can initialize with attributes' do 
      expect(@fac_factory).to be_a(FacilityFactory)
      expect(@fac_factory.facilities).to eq([])
    end
  end

  describe '#create_facilities' do 
    it 'can create hashes of facility data' do 
      expect(@fac_factory.create_facilities(@or_dmv_office_locations)).to be_a(Array)
      expect(@fac_factory.facilities.length).not_to eq(0)
    end

    it 'can create facility objects with attributes' do
      @fac_factory.create_facilities(@or_dmv_office_locations)

      expect(@fac_factory.facilities[0]).to be_a(Facility)
      expect(@fac_factory.facilities[0].name).not_to be nil
      expect(@fac_factory.facilities[0].address).not_to be nil
      expect(@fac_factory.facilities[0].phone).not_to be nil
      expect(@fac_factory.facilities[0].services).to eq([])
      expect(@fac_factory.facilities[0].registered_vehicles).to eq([])
      expect(@fac_factory.facilities[0].collected_fees).to eq(0)
    end

    it 'returns an array of created facilities' do 
      expect(@fac_factory.create_facilities(@or_dmv_office_locations)).to eq(@fac_factory.facilities)
    end

    describe 'it can work with a NY data source' do 
      it 'can create hashes of facility data' do 
        expect(@fac_factory.create_facilities(@ny_dmv_office_locations)).to be_a(Array)
        expect(@fac_factory.facilities.length).not_to eq(0)
      end
  
      it 'can create facility objects with attributes' do
        @fac_factory.create_facilities(@ny_dmv_office_locations)
  
        expect(@fac_factory.facilities[0]).to be_a(Facility)
        expect(@fac_factory.facilities[0].name).not_to be nil
        expect(@fac_factory.facilities[0].address).not_to be nil
        expect(@fac_factory.facilities[0].phone).not_to be nil
        expect(@fac_factory.facilities[0].services).to eq([])
        expect(@fac_factory.facilities[0].registered_vehicles).to eq([])
        expect(@fac_factory.facilities[0].collected_fees).to eq(0)
      end

      it 'returns an array of created facilities' do 
        expect(@fac_factory.create_facilities(@ny_dmv_office_locations)).to eq(@fac_factory.facilities)
      end
    end

    describe 'it can work with a MO data source' do 
      it 'can create hashes of facility data' do 
        expect(@fac_factory.create_facilities(@mo_dmv_office_locations)).to be_a(Array)
        expect(@fac_factory.facilities.length).not_to eq(0)
      end
  
      xit 'can create facility objects with attributes' do
        @fac_factory.create_facilities(@mo_dmv_office_locations)
  
        expect(@fac_factory.facilities[0]).to be_a(Facility)
        expect(@fac_factory.facilities[0].name).not_to be nil
        expect(@fac_factory.facilities[0].address).not_to be nil
        expect(@fac_factory.facilities[0].phone).not_to be nil
        expect(@fac_factory.facilities[0].services).to eq([])
        expect(@fac_factory.facilities[0].registered_vehicles).to eq([])
        expect(@fac_factory.facilities[0].collected_fees).to eq(0)
      end

      xit 'returns an array of created facilities' do 
        expect(@fac_factory.create_facilities(@mo_dmv_office_locations)).to eq(@fac_factory.facilities)
      end
    end
  end
end