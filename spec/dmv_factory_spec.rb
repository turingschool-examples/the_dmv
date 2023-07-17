require './lib/dmv_factory'
require './lib/dmv_data_service'
require './lib/facility'

describe DmvFactory do
  describe "#create_facilities from co_dmv api" do
    dmv_factory = DmvFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
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

  describe "#create_facilities from ny_dmv api" do
    dmv_factory = DmvFactory.new
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    it "brings data in as an Array" do

      expect(dmv_factory.create_facilities(ny_dmv_office_locations)).to be_a Array
    end

    it "The returned array is full of only facility objects" do
      
      
      expect(dmv_factory.create_facilities(ny_dmv_office_locations)).to all be_a Facility
    end

    it "the returned array is not empty" do

      expect(dmv_factory.create_facilities(ny_dmv_office_locations).length).to be_a Integer
    end
  end

  describe "#create_facilities from ny_dmv api" do
    dmv_factory = DmvFactory.new
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    it "brings data in as an Array" do

      expect(dmv_factory.create_facilities(mo_dmv_office_locations)).to be_a Array
    end

    it "The returned array is full of only facility objects" do
      
      
      expect(dmv_factory.create_facilities(mo_dmv_office_locations)).to all be_a Facility
    end

    it "the returned array is not empty" do

      expect(dmv_factory.create_facilities(mo_dmv_office_locations).length).to be_a Integer
    end
  end
end