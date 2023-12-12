require 'spec_helper'
require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
    it 'can initialize' do
        expect(factory = FacilityFactory.new).to be_an_instance_of(FacilityFactory)
        dmv_co = DmvDataService.new.co_dmv_office_locations
        facilities = factory.create_facilities(dmv_co)
        expect(facilities.length).to be_a(Integer)
        expect(facilities.first).to be_an_instance_of(Facility)
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        facilities1 = factory.create_facilities(new_york_facilities)
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations
        facilities2 = factory.create_facilities(missouri_facilities)
        expect(facilities1.first).to be_an_instance_of(Facility)
        expect(facilities2.first).to be_an_instance_of(Facility)
    end
end