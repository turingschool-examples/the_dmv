require 'spec_helper'

RSpec.describe FacilityFactory do 
    it 'exists' do
        factory = FacilityFactory.new
        expect(factory).to be_an_instance_of(FacilityFactory)
    end

    it 'can create a facility' do
        factory = FacilityFactory.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        expect(factory.create_facilitys(co_dmv_office_locations)).to be_an Array
        expect(factory.create_facilitys(co_dmv_office_locations)[0]).to be_an_instance_of Facility 
        expect(factory.create_facilitys(co_dmv_office_locations)[0].name).to eq("DMV Tremont Branch")
        expect(factory.create_facilitys(co_dmv_office_locations)[0].address).to eq("2855 Tremont Place")
        expect(factory.create_facilitys(co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
        
    end 

    it 'can a have a new state ny' do
        factory = FacilityFactory.new
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        expect(factory.create_facilitys(new_york_facilities)).to be_an Array
        expect(factory.create_facilitys(new_york_facilities)[0]).to be_an_instance_of Facility 
        expect(factory.create_facilitys(new_york_facilities)[0].name).to eq("IRONDEQUOIT")
        expect(factory.create_facilitys(new_york_facilities)[0].address).to eq("545 TITUS AVENUE")
        expect(factory.create_facilitys(new_york_facilities)[0].phone).to eq("5857531604")
    end


end 