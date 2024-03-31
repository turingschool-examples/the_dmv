require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'initialize' do
    it "can initialize" do
      facility_factory = FacilityFactory.new

      expect(facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe 'clean_service_data' do
    it "can clean service data" do
      facility_factory = FacilityFactory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      # binding.pry
      services_string = colorado_facilities[0][:services_p]
# binding.pry
      expect(facility_factory.clean_services_data(services_string)).to eq("Vehicle Registration")

    end
  end
  describe 'create_facilities' do
    xit "can create facilities from facility data" do
      facility_factory = FacilityFactory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
# binding.pry
      #need more robust testing for actual vehicle data
      #maybe use vehicle example checking attr filtered correctly
      expect(facility_factory.create_facilities(colorado_facilities)).to all(be_a(Facility))
    end
  end
end