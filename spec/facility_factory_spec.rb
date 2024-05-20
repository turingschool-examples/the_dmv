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
       
    end 

    it 'can create bulk facilities' do
        # expect(@factory.create_vehicles(@wa_ev_registrations).length).to eq(1000)
        expect(@ffactory.create_facilities(@colorado_facilities)).to be_an_instance_of(Array)
        expect(@ffactory.create_facilities(@colorado_facilities)[0]).to be_an_instance_of(Facility)
    end
end