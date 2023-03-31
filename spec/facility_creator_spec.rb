require 'spec_helper'

RSpec.describe FacilityCreator do
  describe "#import facilities" do
    it "imports facilities from DMV API" do
      creator = FacilityCreator.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

      creator.create_facilities(or_dmv_office_locations)
require 'pry'; binding.pry
      expect(creator.facilities).to be_an_instance_of(Array)
      expect(creator.facilities.first).to be_an_instance_of(Facility)
    end
  end
end