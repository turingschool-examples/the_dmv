require 'spec_helper'

RSpec.describe FacilityLocations do
  
  describe '#intialize' do
    it 'can intialize' do
      facility = FacilityLocations.new
      expect(facility).to be_an_instance_of(FacilityLocations)
    end
  end

  describe '#Creating Objects from Multiple Data Sets & Analyzing Data' do
    it 'can create facilities from external data sources' do
      colorado = DmvDataService.new.co_dmv_office_locations
      co_offices = FacilityLocations.new
      co_offices.create_facilities(colorado)

      expect(co_offices.facilities.length).to be > 1
      co_offices.facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name.nil?).to eq(false)
        expect(facility.address.nil?).to eq(false)
        expect(facility.phone.nil?).to eq(false)
      end
    end

    it 'can create facilities from multiple data sources' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      ny_offices = FacilityLocations.new
      ny_offices.create_facilities(new_york_facilities)
  
      ny_offices.facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name.nil?).to eq(false)
        expect(facility.address.nil?).to eq(false)
      end

      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      mo_offices = FacilityLocations.new
      mo_offices.create_facilities(missouri_facilities)
  
      mo_offices.facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name.nil?).to eq(false)
        expect(facility.address.nil?).to eq(false)
      end
    end

    it 'can iterate through a hash and find the hours of operation' do
      colorado = DmvDataService.new.co_dmv_office_locations
      co_offices = FacilityLocations.new
      co_offices.create_facilities(colorado)

      co_offices.facilities.each do |facility|
        expect(facility.hours.nil?).to eq(false)
        expect(facility.hours).to be_an_instance_of(String)
      end

      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      ny_offices = FacilityLocations.new
      ny_offices.create_facilities(new_york_facilities)
  
      ny_offices.facilities.each do |facility|
        expect(facility.hours.nil?).to eq(false)
        expect(facility.hours).to be_an_instance_of(Hash)
      end

      # Uses :daysopen
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      mo_offices = FacilityLocations.new
      mo_offices.create_facilities(missouri_facilities)
  
      mo_offices.facilities.each do |facility|
        expect(facility.hours.nil?).to eq(false)
        expect(facility.hours).to be_an_instance_of(String)
      end
    end
  end
end