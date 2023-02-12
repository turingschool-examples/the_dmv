require 'rspec'
require 'spec_helper'
require './lib/facility'
require './lib/facility_builder'

RSpec.describe FacilityBuilder do
  describe '#initialize' do
    it 'exists' do
      facility = FacilityBuilder.new

      expect(facility).to be_a(FacilityBuilder)
    end
  end

  describe '#build_facility' do
    it 'can create and store facilities from Oregon' do
      facility = FacilityBuilder.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

      facility.build_facility(or_dmv_office_locations)

      expect(facility.facilities).to be_a(Array)
      expect(facility.facilities.first).to be_a(Facility)
      expect(facility.facilities.length).to eq(59)
    end

    it 'can create and store facilities from New York' do
      facility = FacilityBuilder.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      require 'pry'; binding.pry
      facility.build_factory(ny_dmv_office_locations)
    end
  end
end