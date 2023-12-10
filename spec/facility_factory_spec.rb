require 'spec_helper'

RSpec.describe FacilityFactory do 
    describe '#initialize' do 
        it 'initializes' do 
           facility_factory =  FacilityFactory.new 
           
           expect(facility_factory).to be_an_instance_of(FacilityFactory)
        end 
    end 

    describe '#create_co_facility' do 
        it 'is an object of Facility' do 
            facility_factory =  FacilityFactory.new 
            colorado_facilities = DmvDataService.new.co_dmv_office_locations

            expect(facility_factory.create_co_facilities(colorado_facilities).first).to be_an_instance_of(Facility)
        end 
    end 
end 