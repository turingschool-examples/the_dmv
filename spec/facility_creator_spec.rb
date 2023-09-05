require 'spec_helper'

RSpec.describe FacilityCreator do
  describe '#initialize' do
    it 'exists' do
      creator = FacilityCreator.new
      expect(creator).to be_a(FacilityCreator)
    end
  end

  describe '#Accessing API' do
    it 'connects to API' do
      creator = FacilityCreator.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      expect(co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations).to be_a(Array)
    end

    it 'returns facilities' do
      creator = FacilityCreator.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_facilities = creator.create_facilities(co_dmv_office_locations)
      expect(new_facilities).to be_a(Array)
      expect(new_facilities).to all be_a(Facility)
    end
  end
end