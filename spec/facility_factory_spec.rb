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
      result = factory.create_facilities(co_dmv_office_locations)
      expect(result.class).to eq(Array)
      expect(result.first.class).to eq(Facility)
      #did not know how to write what to expect for the output.
    end
  end

  describe '#create facilities' do
    it 'can create a facility from multiple provided datasets' do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      co_result = factory.create_facilities(co_dmv_office_locations)
      ny_result = factory.create_facilities(new_york_facilities)
      mo_result = factory.create_facilities(missouri_facilities)
      expect(co_result.class).to eq(Array)
      expect(co_result.first.class).to eq(Facility)
      expect(ny_result.class).to eq(Array)
      expect(ny_result.first.class).to eq(Facility)
      expect(mo_result.class).to eq(Array)
      expect(mo_result.first.class).to eq(Facility)
      #did not know how to write what to expect for the output.
    end
  end
end 