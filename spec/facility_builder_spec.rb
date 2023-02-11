require 'rspec'
require 'spec_helper'
require './lib/facility'
require './lib/facility_builder'

RSpec.describe FacilityBuilder do
  describe '#initialize' do
    it 'exists' do
      facility = FacilityBuilder.new
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#build_facility' do
    it 'can create and store facilities' do
      facitlity = FacilityBuilder.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      facility.build_facility(or_dmv_office_locations)

      expect(facility.facilities).to be_a(Array)
      expect(facility.facilities.first).to be_a(Facility)
      expect(facility.facilities.length).to eq()
    end
  end
end