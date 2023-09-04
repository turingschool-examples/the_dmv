require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#DMV facility data' do
    it 'creates facilities' do
      facility = FacilityFactory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations

      expect(facility.create_facility(colorado_facilities)[0]).to be_instance_of Facility
      facility.create_facility(colorado_facilities).each do |data|
      expect(data).to be_instance_of Facility
      end
    end

    it 'creates new york facilities' do
      facility = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(facility.create_facility(new_york_facilities)[0]).to be_instance_of Facility
      expect(facility.create_facility(new_york_facilities)[3]).to be_instance_of Facility
      facility.create_facility(new_york_facilities).each do |data|
      expect(data).to be_instance_of Facility
      end
    end

    it 'creates Missouri facilities' do
      facility = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(facility.create_facility(missouri_facilities)[0]).to be_instance_of Facility
      expect(facility.create_facility(missouri_facilities)[3]).to be_instance_of Facility
      facility.create_facility(missouri_facilities).each do |data|
      expect(data).to be_instance_of Facility
      end
    end
  end
end