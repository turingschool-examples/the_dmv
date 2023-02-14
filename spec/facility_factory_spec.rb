require 'spec_helper'

RSpec.describe FacilityFactory do
  oregon_facility_data = DmvDataService.new.or_dmv_office_locations
  new_york_facility_data = DmvDataService.new.ny_dmv_office_locations
  missouri_facility_data = DmvDataService.new.mo_dmv_office_locations

  factory = FacilityFactory.new

  oregon_facilities = factory.create_facilities(oregon_facility_data)
  new_york_facilities = factory.create_facilities(new_york_facility_data)
  missouri_facilities = factory.create_facilities(missouri_facility_data)

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    it 'returns an array' do
      expect(oregon_facilities).to be_a(Array)
      expect(new_york_facilities).to be_a(Array)
      expect(missouri_facilities).to be_a(Array)
    end

    it 'returns an array of Facility objects' do
      expect(oregon_facilities.all? { |facility| facility.is_a?(Facility) }).to be(true)
      expect(new_york_facilities.all? { |facility| facility.is_a?(Facility) }).to be(true)
      expect(missouri_facilities.all? { |facility| facility.is_a?(Facility) }).to be(true)
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

    it 'assigns the correct attributes and values to Oregon facilities' do
      or_facility_1 = factory.create_facilities(oregon_facility_data).first

      expect(or_facility_1.name).to eq(OR_FACILITY[:name])
      expect(or_facility_1.address).to eq(OR_FACILITY[:address])
      expect(or_facility_1.phone).to eq(OR_FACILITY[:phone])
    end

    it 'assigns the correct attributes and values to New York facilities' do
      ny_facility_1 = factory.create_facilities(new_york_facility_data).first

      expect(ny_facility_1.name).to eq(NY_FACILITY[:name])
      expect(ny_facility_1.address).to eq(NY_FACILITY[:address])
      expect(ny_facility_1.phone).to eq(NY_FACILITY[:phone])
    end

    it 'assigns the correct attributes and values to Missouri facilities' do
      mo_facility_1 = factory.create_facilities(missouri_facility_data).first

      expect(mo_facility_1.name).to eq(MO_FACILITY[:name])
      expect(mo_facility_1.address).to eq(MO_FACILITY[:address])
      expect(mo_facility_1.phone).to eq(MO_FACILITY[:phone])
    end

    it 'returns nil for invalid state data' do
      expect(factory.create_facilities([])).to be(nil)
    end
  end

  describe '#get_us_state' do
    it 'returns the :OR symbol for Washington facility data' do
      expect(factory.get_us_state(oregon_facility_data)).to be(:OR)
    end

    it 'returns the :NY symbol for New York facility data' do
      expect(factory.get_us_state(new_york_facility_data)).to be(:NY)
    end

    it 'returns the :MO symbol for Missouri facility data' do
      expect(factory.get_us_state(missouri_facility_data)).to be(:MO)
    end

    it 'returns nil for any other invalid vehicle data' do
      expect(factory.get_us_state([])).to be(nil)
    end
  end

  describe '#create_oregon_facilities' do
    it 'assigns the correct attributes and values to OR facilities' do
      or_facility_1 = factory.create_oregon_facilities(oregon_facility_data)
        .first
      expect(or_facility_1.name).to eq(OR_FACILITY[:name])
      expect(or_facility_1.address).to eq(OR_FACILITY[:address])
      expect(or_facility_1.phone).to eq(OR_FACILITY[:phone])
      expect(or_facility_1.services).to eq([])
      expect(or_facility_1.registered_vehicles).to eq([])
      expect(or_facility_1.collected_fees).to eq(0)
    end
  end

  describe '#create_new_york_facilities' do
    it 'assigns the correct attributes and values to NY facilities' do
      ny_facility_1 = factory.create_new_york_facilities(new_york_facility_data)
        .first
      expect(ny_facility_1.name).to eq(NY_FACILITY[:name])
      expect(ny_facility_1.address).to eq(NY_FACILITY[:address])
      expect(ny_facility_1.phone).to eq(NY_FACILITY[:phone])
      expect(ny_facility_1.services).to eq([])
      expect(ny_facility_1.registered_vehicles).to eq([])
      expect(ny_facility_1.collected_fees).to eq(0)
    end
  end

  describe '#create_missouri_facilities' do
    it 'assigns the correct attributes and values to MO facilities' do
      mo_facility_1 = factory.create_missouri_facilities(missouri_facility_data)
        .first
      expect(mo_facility_1.name).to eq(MO_FACILITY[:name])
      expect(mo_facility_1.address).to eq(MO_FACILITY[:address])
      expect(mo_facility_1.phone).to eq(MO_FACILITY[:phone])
      expect(mo_facility_1.services).to eq([])
      expect(mo_facility_1.registered_vehicles).to eq([])
      expect(mo_facility_1.collected_fees).to eq(0)
    end
  end
end
