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
      array_of_facility_data = factory.create_facility(co_dmv_office_locations)
      facility_1 = array_of_facility_data.sample

      expect(facility_1.name).to be_a(String)
      expect(facility_1.address).to be_a(String)
      expect(facility_1.phone).to be_a(String)
    end
  end

end