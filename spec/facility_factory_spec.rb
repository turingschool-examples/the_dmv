require 'spec_helper'

RSpec.describe FacilityFactory do
  oregon_facility_data = DmvDataService.new.or_dmv_office_locations
  new_york_facility_data = DmvDataService.new.ny_dmv_office_locations
  missouri_facility_data = DmvDataService.new.mo_dmv_office_locations

  factory = FacilityFactory.new

  oregon_facilities = factory.create_facilities(oregon_facility_data, :OR)
  new_york_facilities = factory.create_facilities(new_york_facility_data, :NY)
  missouri_facilities = factory.create_facilities(missouri_facility_data, :MO)

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    it 'returns an array' do
      expect(oregon_facilities).to be_a(Array)
      expect(new_york_facilities).to be_a(Array)
      # expect(missouri_facilities).to be_a(Array)
    end

    it 'returns an array of Facility objects' do
      expect(oregon_facilities.all? { |facility| facility.is_a?(Facility) }).to be(true)
      expect(new_york_facilities.all? { |facility| facility.is_a?(Facility) }).to be(true)
      # expect(missouri_facilities.all? { |facility| facility.is_a?(Facility) }).to be(true)
    end

    it 'assigns the @name attribute on every facility to a string value' do
      expect(oregon_facilities.all? { |facility| facility.name.is_a?(String) }).to be(true)
    end

    it 'assigns the @address attribute on every facility to a string value' do
      expect(oregon_facilities.all? { |facility| facility.address.is_a?(String) }).to be(true)
    end

    it 'assigns the @phone attribute on every facility to a string value' do
      expect(oregon_facilities.all? { |facility| facility.phone.is_a?(String) }).to be(true)
    end

    it 'assigns the correct string value to the @name attribute on every Oregon facility' do
      expect(oregon_facilities.first.name).to eq(OR_FACILITY[:name])
    end

    it 'assigns the correct string value to the @address attribute on every Oregon facility' do
      expect(oregon_facilities.first.address).to eq(OR_FACILITY[:address])
    end

    it 'assigns the correct string value to the @phone attribute on every Oregon facility' do
      expect(oregon_facilities.first.phone).to eq(OR_FACILITY[:phone])
    end

    it 'assigns the correct string value to the @name attribute on every New York facility' do
      expect(new_york_facilities.first.name).to eq(NY_FACILITY[:name])
    end

    it 'assigns the correct string value to the @address attribute on every New York facility' do
      expect(new_york_facilities.first.address).to eq(NY_FACILITY[:address])
    end

    it 'assigns the correct string value to the @phone attribute on every New York facility' do
      expect(new_york_facilities.first.phone).to eq(NY_FACILITY[:phone])
    end
  end
end
