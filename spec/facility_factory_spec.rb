require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
  end

  describe '#initialize' do
    it 'can itilialize' do
      @facility_factory = VehicleFactory.new

      expect(@facility_factory).to be_an_instance_of(FacilityFactory)
      expect(@facility_factory.facilities).to eq([])
    end
  end

  describe '#create_facilities' do
    it 'can create and store facilities' do
      
    end
  end
end