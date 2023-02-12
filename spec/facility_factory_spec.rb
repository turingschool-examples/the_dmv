require 'spec_helper'

RSpec.describe FacilityFactory do
  or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

  factory = FacilityFactory.new

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(FacilityFactory)
    end
  end
end
