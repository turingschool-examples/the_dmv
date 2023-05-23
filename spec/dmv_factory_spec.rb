require 'spec_helper'
require './lib/dmv_factory'
require './lib/facility'
require './lib/dmv_data_service'

RSpec.describe DmvFactory do
    describe "#initialize" do
      it "exists" do
        or_facilites = DmvFactory.new(DmvDataService.new.or_dmv_office_locations)

        expect(or_facilites).to be_an_instance_of(DmvFactory)
        expect(or_facilites.state_dmv_locations).to be_an(Array)
        expect(or_facilites.state_dmv_locations[0]).to be_a(Hash)
        expect(or_facilites.state_dmv_locations[0][:title]).to be_a(String)
      end
    end
  
    describe "#create_OR_facility" do
      it "can create facilities" do
        or_facilites = DmvFactory.new(DmvDataService.new.or_dmv_office_locations)
  
        expect(or_facilites.create_facilities).to be_an(Array)
        expect(or_facilites.create_facilities[0]).to be_an_instance_of(DmvFactory)
        expect(or_facilites.create_facilities[0].title).to be_a(String)
      end
    end
end
   