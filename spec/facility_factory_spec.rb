require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'initialize' do
    it 'creates a new facility factory' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_co_facilities' do
    it 'creates colorado DMVs with relavent data' do
      factory = FacilityFactory.new
      facilities = factory.create_co_facilities
      facilities.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility.address).to_not eq(nil)
      end
    end
  end
end