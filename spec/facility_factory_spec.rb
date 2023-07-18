require './lib/dmv_data_service'
require './lib/facility_factory'

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe "#create_facility" do
    it "can create facility" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      co_dmv_facilities = factory.create_facility(co_dmv_office_locations)
      co_facility_1 = co_dmv_facilities.sample

      expect(co_facility_1.name).to be_a(String)
      expect(co_facility_1.address).to be_a(String)
      expect(co_facility_1.phone).to be_a(String)

      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      new_york_facilities = factory.create_facility(ny_dmv_office_locations)
      ny_facility_1 = new_york_facilities.sample

      expect(ny_facility_1.name).to be_a(String)
      expect(ny_facility_1.address).to be_a(String)
      expect(ny_facility_1.phone).to be_a(String)
    end
  end

end