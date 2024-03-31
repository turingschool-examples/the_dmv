require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'initialize' do
    it "can initialize" do
      facility_factory = FacilityFactory.new

      expect(facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe 'create_facilities' do
    it "can create cars from registrations" do
      facility_factory = FacilityFactory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations

      expect(facility_factory.create_facilities(colorado_facilities)).to all(be_a(Facility))
    end
  end
end