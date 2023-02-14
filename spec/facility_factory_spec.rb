require 'rspec'
require 'json'
require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'exists' do
      facility_factory = FacilityFactory.new

      expect(facility_factory).to be_a(FacilityFactory)
      expect(facility_factory.new_facilities).to eq([])
    end
  end

  describe '#create_facility' do
    it 'can create a facility' do
      facility_factory = FacilityFactory.new
      facility1 = {:name=>'Test', :address=>'123 Spring St', :phone=>'(555)123-0987'}
      facility2 = {:name=>'Test2', :address=>'456 Spruce Ave', :phone=>'(555)465-2049'}
      expect(facility_factory.create_facility(facility1)[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[0].name).to eq('Test')
      expect(facility_factory.new_facilities[0].address).to eq('123 Spring St')
      expect(facility_factory.new_facilities[0].phone).to eq('(555)123-0987')
      expect(facility_factory.new_facilities.size).to eq(1)
      expect(facility_factory.create_facility(facility2)[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[1].name).to eq('Test2')
      expect(facility_factory.new_facilities[1].address).to eq('456 Spruce Ave')
      expect(facility_factory.new_facilities[1].phone).to eq('(555)465-2049')
      expect(facility_factory.new_facilities.size).to eq(2)
    end
  end

  describe '#create_facilities' do
    it 'can create multiple facilities at once (from OR)' do
      facility_factory = FacilityFactory.new
      new_locations = DmvDataService.new.or_dmv_office_locations
      facility_factory.create_facilities(new_locations)

      expect(facility_factory.new_facilities.length).to eq(59)
      expect(facility_factory.new_facilities[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[1]).to be_a(Facility)
      expect(facility_factory.new_facilities[2]).to be_a(Facility)
    end

    it 'can create multiple facilities at once (from NY)' do
    facility_factory = FacilityFactory.new
    new_locations = DmvDataService.new.ny_dmv_office_locations
    facility_factory.create_facilities(new_locations)

    expect(facility_factory.new_facilities.length).to eq(169)
    expect(facility_factory.new_facilities[0]).to be_a(Facility)
    expect(facility_factory.new_facilities[1]).to be_a(Facility)
    expect(facility_factory.new_facilities[2]).to be_a(Facility)
    end
  end
end