require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#FacilityFactory' do
    it 'can initialize and object' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create facilities' do
    it 'can create a facility from provided data' do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      expect(factory.create_facilities(co_dmv_office_locations)).to_not be nil
      #did not know how to write what to expect for the output.
    end
  end
end 