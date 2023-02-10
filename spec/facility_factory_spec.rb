require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @or_dmv_offices = DmvDataService.new.or_dmv_office_locations

  end

  describe '#Iteration 3' do
    it 'can pull address from OR data' do
      expect(@facility_factory.or_find_address(@or_dmv_offices[0])).to eq("2242 Santiam Hwy SE Albany OR 97321")
    end
  
    it 'can create Facility class from Oregon DMV data' do
      @facility_factory.or_create_facilites(@or_dmv_offices)
      expect(@facility_factory.facilities[0]).to be_an_instance_of(Facility)
    end
  end
end