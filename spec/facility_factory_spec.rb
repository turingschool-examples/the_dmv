require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'
require 'spec_helper'


RSpec.configure do |config|
    config.formatter = :documentation
    end

  RSpec.describe FacilityFactory do
    before (:each) do
        @colorado_facilities = DmvDataService.new.co_dmv_office_locations
        @ffactory = FacilityFactory.new
        @ny_facilities = DmvDataService.new.ny_dmv_office_locations
        @mo_facilities = DmvDataService.new.mo_dmv_office_locations
    end  
  
  describe 'colorado facilities' do
    it 'can create bulk facilities' do
        # expect(@ffactory.create_facility(@colorado_facilities).length).to eq(5)
        # # expect(@ffactory.create_facility(@colorado_facilities.address)).to eq(address)
        # # expect(@ffactory.create_facilities(@colorado_facilities)).to be_an_instance_of(Array)
        # expect(@ffactory.create_facility(@colorado_facilities)[0]).to be_an_instance_of(Facility)
        # expect(@ffactory.create_facility(@colorado_facilities)[0].name).to eq("DMV Tremont Branch")
        expect(@ffactory.create_facility(@colorado_facilities)[0].address).to eq("2855 Tremont Place  Denver CO 80205")
        # expect(@ffactory.create_facility(@colorado_facilities)[3].address).to eq("3100 S. Sheridan Blvd.  Denver CO 80227")

        # expect(@ffactory.create_facility(@ny_facilities)).to eq("")
       expect(@ffactory.create_facility(@mo_facilities)).to eq("")
        end
    end 
end