require 'spec_helper'

RSpec.describe FacilityGenerator do
  
  let(:factory) {FacilityGenerator.new}
  let(:or_dmv_office_locations) { DmvDataService.new.or_dmv_office_locations }
  let(:ny_dmv_office_locations) { DmvDataService.new.ny_dmv_office_locations }
  
  describe '#create_facility' do
    it 'returns an array of facilities' do
      facilities = factory.create_facility(or_dmv_office_locations)
      
      expect(facilities).to all(be_a(Facility))
    end
  end
end