require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @fac_factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  end

  describe '#initialize' do 
    it 'can initialize with attributes' do 
      expect(@fac_factory).to be_a(FacilityFactory)
      expect(@fac_factory.facilities).to eq([])
    end
    
  end
end