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
  
    describe '#create colorado facilities' do
        it 'can create bulk facilities' do
            expect(@ffactory.create_facility(@colorado_facilities).length).to eq(5)
            expect(@ffactory.create_facility(@colorado_facilities)[0]).to be_an_instance_of(Facility)
            expect(@ffactory.create_facility(@colorado_facilities)[0].name).to eq("DMV Tremont Branch")
            expect(@ffactory.create_facility(@colorado_facilities)[0].address).to eq("2855 Tremont Place  Denver CO 80205")
            expect(@ffactory.create_facility(@colorado_facilities)[3].address).to eq("3100 S. Sheridan Blvd.  Denver CO 80227")
        end 
    end

    describe '#create new york facilities' do
        it 'can create bulk facilities' do
            expect(@ffactory.create_facility(@ny_facilities).length).to eq(169)
            expect(@ffactory.create_facility(@ny_facilities)[0]).to be_an_instance_of(Facility)
            expect(@ffactory.create_facility(@ny_facilities)[0].name).to eq("IRONDEQUOIT")
            expect(@ffactory.create_facility(@ny_facilities)[0].address).to eq("545 TITUS AVENUE  ROCHESTER NY 14617")
        end
    end

    describe '#create missouri facilities' do
        it 'can create bulk facilities' do
            expect(@ffactory.create_facility(@mo_facilities).length).to eq(178)
            expect(@ffactory.create_facility(@mo_facilities)[0]).to be_an_instance_of(Facility)
            expect(@ffactory.create_facility(@mo_facilities)[0].name).to eq("NEVADA")
            expect(@ffactory.create_facility(@mo_facilities)[0].address).to eq("409 E AUSTIN BLVD NEVADA MO 64772")
        end
    end
    
end