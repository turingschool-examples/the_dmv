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

  describe '#create facilities' do
    it 'can create a facility from multiple provided datasets' do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      expect(factory.create_facilities(co_dmv_office_locations)).to_not be nil
      expect(factory.create_facilities(new_york_facilities)).to_not be nil
      expect(factory.create_facilities(missouri_facilities)).to_not be nil
      #did not know how to write what to expect for the output.
    end
  end
end 