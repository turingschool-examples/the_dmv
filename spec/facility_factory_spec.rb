require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    it "creates an array of facility objects with or_dmv_office_locations" do
      factory = FacilityFactory.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      test1 = factory.create_facilities(or_dmv_office_locations)
      expect(test1).to be_an_instance_of(Array)
    end

    it "creates an array of facility objects with ny_dmv_office_locations" do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      test2 = factory.create_facilities(ny_dmv_office_locations)
      expect(test2).to be_an_instance_of(Array)
    end

    it "creates an array of facility objects with mo_dmv_office_locations" do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      test3 = factory.create_facilities(mo_dmv_office_locations)
      expect(test3).to be_an_instance_of(Array)
    end
  end
end