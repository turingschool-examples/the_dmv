require 'spec_helper'

RSpec.describe FacilityGenerator do
  
  let(:factory) {FacilityGenerator.new}
  let(:or_dmv_office_locations) { DmvDataService.new.or_dmv_office_locations }
  let(:ny_dmv_office_locations) { DmvDataService.new.ny_dmv_office_locations }
  let(:mo_dmv_office_locations) { DmvDataService.new.mo_dmv_office_locations }

  describe '#create_facility' do
    it 'returns an array of facilities' do
      or_facilities = factory.create_facility_or(or_dmv_office_locations)
    
      expect(or_facilities).to all(be_a(Facility))
    end
    
    it 'returns an array of facilities but with a NY dataset' do
      ny_facilities = factory.create_facility_ny(ny_dmv_office_locations)

      expect(ny_facilities).to all(be_a(Facility))
    end

    it 'returns an array of facilities but with a MO dataset' do
      # require 'pry'; binding.pry
      mo_facilities = factory.create_facility_mo(mo_dmv_office_locations)
require 'pry'; binding.pry
      expect(mo_facilities).to all(be_a(Facility))
    end
  end
end