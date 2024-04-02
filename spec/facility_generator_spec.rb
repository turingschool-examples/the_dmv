require 'spec_helper'

RSpec.describe FacilityGenerator do
    before(:each) do
        @facility_generator = FacilityGenerator.new
        @facilities = DmvDataService.new.co_dmv_office_locations
    end
    
    describe '#initialize' do
        it 'can initialize' do
        expect(@facility_generator).to be_an_instance_of(FacilityGenerator)
        end
    end
    
    describe '#create_facilities' do
        it 'can return array of facility objects' do

        expect(@facility_generator.create_facilities(@facilities)).to be_an_instance_of(Array)
        
        expect(@facility_generator.create_facilities(@facilities).first).to be_an_instance_of(Facility)

        expect(@facility_generator.create_facilities(@facilities)[0].name).to eq(@facilities[0][:dmv_office])

        expect(@facility_generator.create_facilities(@facilities)[0].address).to eq("#{@facilities[0][:address_li]}, #{@facilities[0][:address_1]}, #{@facilities[0][:city]}, #{@facilities[0][:state]} #{@facilities[0][:zip]}")

        expect(@facility_generator.create_facilities(@facilities)[0].phone).to eq(@facilities[0][:phone])
        end
    end
    
    end