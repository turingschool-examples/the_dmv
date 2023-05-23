require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
      oregon_facilities = DmvDataService.new.or_dmv_office_locations

      expect(oregon_facilities).to be_a(Array)
      expect(oregon_facilities[0]).to be_a(Hash)
      expect(oregon_facilities[0][:title]).to be_a(String)
      expect(oregon_facilities[0][:location_1]).to be_a(Hash)
    end
  end
  
  describe `#create_oregon_facility` do
    it 'can create facility objects from oregon dmv data' do
      or_dmv_facilities = DmvDataService.new.or_dmv_office_locations
      
      expect(or_dmv_facilities).to be_a(Array)
      expect(or_dmv_facilities.first).to be_a(Hash)
      or_dmv_facilities.each do |or_dmv|
        expect(or_dmv[:location_1][:human_address]).to be_a(String)
      end
      
      facility = FacilityFactory.new
      oregon = facility.facility_creator(or_dmv_facilities)
      expect(oregon).to be_a(Array)
      expect(oregon.first).to be_a(Facility)
    end
  end

  describe `#create_new_york_facility` do
    it 'can create facility objects from new york dmv data' do
      # factory = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      
      expect(new_york_facilities).to be_a(Array)
      expect(new_york_facilities.first).to be_a(Hash)
      new_york_facilities.each do |ny_dmv|
        expect(ny_dmv[:office_name]).to be_a(String)
      end

      facility = FacilityFactory.new
      ny = facility.facility_creator(new_york_facilities)
      expect(ny).to be_a(Array)
    end
  end

  describe `#create_missouri_facility` do
    it 'can create facility objects from oregon dmv data' do
      # factory = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      
      expect(missouri_facilities).to be_a(Array)
      expect(missouri_facilities.first).to be_a(Hash)
      missouri_facilities.each do |mo_dmv|
        expect(mo_dmv[:name]).to be_a(String)
      end

      facility = FacilityFactory.new
      mo = facility.facility_creator(missouri_facilities)
      expect(mo).to be_a(Array)
    end
  end
end  
