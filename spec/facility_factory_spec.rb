require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'initialize' do
    it 'creates a new facility factory' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facilities(state_abbv)' do
    it 'creates DMVs specific to the specified state' do
      factory = FacilityFactory.new
      facilities = factory.create_facilities("CO")
      facilities.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility.address).to include("CO")
      end
    end
  end  

  describe '#create_co_facilities' do
    it 'creates Colorado DMVs with relavent data' do
      factory = FacilityFactory.new
      facilities = factory.create_co_facilities
      facilities.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility.address).to_not eq(nil)
      end
    end
  end

  describe '#create_ny_facilities' do
    it 'creates New York DMVs with relavent data' do
      factory = FacilityFactory.new
      facilities = factory.create_ny_facilities
      facilities.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility.address).to_not eq(nil)
      end
    end
  end

  describe '#create_mo_facilities' do
    it 'creates Missouri DMVs with relavent data' do
      factory = FacilityFactory.new
      facilities = factory.create_mo_facilities
      facilities.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility.address).to_not eq(nil)
      end
    end
  end
end