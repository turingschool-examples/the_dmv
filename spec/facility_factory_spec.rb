require 'rspec'
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
      facility2 = {:name=>'Test2', :address=>'456 Spruce Ave', :phone=>'(555-465-2049)'}
      expect(facility_factory.create_facility(facility1)[0]).to be_a(Facility)
      expect(facility_factory.new_facilities.size).to eq(1)
      expect(facility_factory.create_facility(facility2)[0]).to be_a(Facility)
      expect(facility_factory.new_facilities.size).to eq(2)
    end
  end
end