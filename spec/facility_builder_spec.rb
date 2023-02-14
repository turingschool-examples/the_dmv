require 'rspec'
require 'spec_helper'
require './lib/facility'
require './lib/facility_builder'
require './lib/dmv_data_service'

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

      expect(facility.or_facilities).to be_a(Array)
      expect(facility.or_facilities.first).to be_a(Facility)
      expect(facility.or_facilities.length).to eq(59)
    end

    it 'can create and store facilities from New York' do
      facility = FacilityBuilder.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations

      facility.build_facility(ny_dmv_office_locations)

      expect(facility.ny_facilities).to be_a(Array)
      expect(facility.ny_facilities).to all(be_a Facility)
      expect(facility.ny_facilities.length).to eq(169)
    end

    it 'can create and store facilities from Missouri' do
      facility = FacilityBuilder.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

      facility.build_facility(mo_dmv_office_locations)

      expect(facility.mo_facilities).to be_a(Array)
      expect(facility.mo_facilities).to all(be_a Facility)
      expect(facility.mo_facilities.length).to eq(178)
    end

    it 'works with all three state facilities' do
      facility = FacilityBuilder.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

      facility.build_facility(or_dmv_office_locations)
      facility.build_facility(ny_dmv_office_locations)
      facility.build_facility(mo_dmv_office_locations)
    
      expect(facility.or_facilities.length).to eq(59)
      expect(facility.mo_facilities.length).to eq(178)
      expect(facility.ny_facilities.length).to eq(169)
    end
  end
end