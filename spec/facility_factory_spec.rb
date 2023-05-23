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
      
      facility = FacilityFactory.new
      oregon = facility.facility_creator(or_dmv_facilities)
      expect(oregon).to be_a(Array)
      expect(oregon.first).to be_a(Facility)

      expect(or_dmv_facilities).to be_a(Array)
      expect(or_dmv_facilities.first).to be_a(Hash)
     
      or_dmv_facilities.each do |or_dmv|
        expect(or_dmv[:title]).to be_a(String)
        expect(or_dmv[:phone_number]).to be_a(String)
        expect(or_dmv[:location_1]).to have_key(:human_address)
        expect(or_dmv[:location_1][:human_address]).to be_a(String)
      end
    end
  end

  describe `#create_new_york_facility` do
    it 'can create facility objects from new york dmv data' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      
      facility = FacilityFactory.new
      new_york = facility.facility_creator(new_york_facilities)
      expect(new_york).to be_a(Array)
      expect(new_york.first).to be_a(Facility)

      expect(new_york_facilities).to be_a(Array)
      expect(new_york_facilities.first).to be_a(Hash)
      
      new_york_facilities.each do |ny_dmv|
        expect(ny_dmv[:office_name]).to be_a(String)
        expect(ny_dmv).to have_key(:street_address_line_1)
        expect(ny_dmv[:city]).to be_a(String)
      end
    end
  end

  describe `#create_missouri_facility` do
    it 'can create facility objects from missouri dmv data' do
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      
      facility = FacilityFactory.new
      missouri = facility.facility_creator(missouri_facilities)
      expect(missouri).to be_a(Array)
      expect(missouri.first).to be_a(Facility)

      expect(missouri_facilities).to be_a(Array)
      expect(missouri_facilities.first).to be_a(Hash)
      
      missouri_facilities.each do |mo_dmv|
        expect(mo_dmv[:name]).to be_a(String)
        expect(mo_dmv).to have_key(:zipcode)
        expect(mo_dmv[:address1]).to be_a(String)
      end
    end
  end
end  
