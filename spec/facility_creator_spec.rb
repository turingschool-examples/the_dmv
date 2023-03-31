require 'spec_helper'

RSpec.describe FacilityCreator do
  describe "#import facilities" do
    it "imports facilities for Oregon from DMV API" do
      creator = FacilityCreator.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

      creator.create_facilities(or_dmv_office_locations)
      expect(creator.facilities).to be_an_instance_of(Array)
      expect(creator.facilities.first).to be_an_instance_of(Facility)
    end

    it "imports facilities for New York from DMV API" do
      creator = FacilityCreator.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations

      creator.create_facilities(ny_dmv_office_locations)
      expect(creator.facilities).to be_an_instance_of(Array)
      expect(creator.facilities.first).to be_an_instance_of(Facility)
    end

    it "imports facilities for Missouri from DMV API" do
      creator = FacilityCreator.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

      creator.create_facilities(mo_dmv_office_locations)
      require 'pry'; binding.pry
      expect(creator.facilities).to be_an_instance_of(Array)
      expect(creator.facilities.first).to be_an_instance_of(Facility)
    end
  end
end