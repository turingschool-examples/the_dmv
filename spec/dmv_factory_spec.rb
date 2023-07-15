require './lib/dmv_factory'
require './lib/dmv_data_service'
require './lib/facility'

describe DmvFactory do
  dmv_factory = DmvFactory.new
  co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  describe "#create_facilities" do
    it "brings data in as an Array" do

      expect(dmv_factory.create_facilities(co_dmv_office_locations)).to be_a Array
    end

    it "The returned array is full of only facility objects" do
      
      
      expect(dmv_factory.create_facilities(co_dmv_office_locations)).to all be_a Facility
    end

    it "the returned array is not empty" do

      expect(dmv_factory.create_facilities(co_dmv_office_locations).length).to be_a Integer
    end
  end
ender