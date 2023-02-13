require 'spec_helper'

RSpec.describe FacilityGenerator do
  
  let(:factory) {FacilityGenerator.new}
  let(:or_dmv_office_locations) { DmvDataService.new.or_dmv_office_locations }
  let(:ny_dmv_office_locations) { DmvDataService.new.ny_dmv_office_locations }
  
  describe '#create_facility' do
    it 'returns an array of facilities' do
      or_facilities = factory.create_facility(or_dmv_office_locations)
      
      expect(or_facilities).to all(be_a(Facility))
    end
    
    it 'returns an array of facilities but with a different dataset' do
      ny_facilities = factory.create_facility(ny_dmv_office_locations)
      
      expect(ny_facilities).to all(be_a(Facility))
    end
  end
end