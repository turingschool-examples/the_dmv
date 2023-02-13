require 'rspec'
require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'exists' do
      facility_factory_1 = FacilityFactory.new

      expect(facility_factory_1).to be_a(FacilityFactory)
    end
  end

  describe '#create_facilities'
    it 'can create a facility'
      facility_factory_1 = FacilityFactory.new
      facility1 = {:name=>'Test', :address=>'123 Spring St', :phone=>'(555)123-0987'}
      facility_factory.create_facilities(facility1)

      expect(dmv.facilities.size).to eq(1)
end