require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @or_dmv_offices = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_offices = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_offices = DmvDataService.new.mo_dmv_office_locations

  end

  describe '#Iteration 3' do
    it 'can pull address from OR data' do
      expect(@facility_factory.or_find_address(@or_dmv_offices[0])).to eq("2242 Santiam Hwy SE Albany OR 97321")
    end
  
    it 'can create Facility class from Oregon DMV data' do
      @facility_factory.or_create_facilities(@or_dmv_offices)
      expect(@facility_factory.facilities[0]).to be_an_instance_of(Facility)
      expect(@facility_factory.facilities[0].phone.length).to eq(12)
    end
    
    it 'can pull address from NY data' do
      expect(@facility_facotry.ny_find_address(@ny_dmv_offices[0])).to eq('512 WEST 3RD STREET JAMESTOWN NY 14701')
    end

    it 'can create Facility class from NY DMV data' do
      @facility_factory.ny_create_facilities(@ny_dmv_offices)
      expect(@facility_factory.facilities[0]).to be_an_instance_of(Facility)
      expect(@facility_factory.facilities[0].phone.length).to eq(10)
    end
  end
end