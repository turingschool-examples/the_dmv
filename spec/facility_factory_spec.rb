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

    it 'can have a new state mo' do
        factory = FacilityFactory.new
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations
        expect(factory.create_facilitys(missouri_facilities)).to be_an Array
        expect(factory.create_facilitys(missouri_facilities)[0]).to be_an_instance_of Facility 
        expect(factory.create_facilitys(missouri_facilities)[0].name).to eq("DEXTER")
        expect(factory.create_facilitys(missouri_facilities)[0].address).to eq("119 VINE ST")
        expect(factory.create_facilitys(missouri_facilities)[0].phone).to eq("(573) 624-8808")
    end

    it 'should be able to construct a facility factory co' do 
        factory = FacilityFactory.new
        office_data = {
            :dmv_office=> "Tampa",
            :address_li=> "12907 conquistador loop",
            :phone=> "(813)534-2977"
        }
        expect_hash = {
            :name=> "Tampa",
            :address=> "12907 conquistador loop",
            :phone=> "(813)534-2977"
        }

        expect(factory.construct_co_facility_attr_helper(office_data)).to eq(expect_hash)

    end

    it 'should be able to construct a facility factory ny' do 
        factory = FacilityFactory.new
        office_data = {
            :office_name=> "Miami",
            :street_address_line_1=> "3428 Townhouse Ct",
            :public_phone_number=> "(813)556-2525"
        }
        expect_hash = {
            :name=> "Miami",
            :address=> "3428 Townhouse Ct",
            :phone=> "(813)556-2525"
        }

        expect(factory.construct_ny_facility_attr_helper(office_data)).to eq(expect_hash)
    end 

    it 'should be able to construct a facility factory mo' do
        factory = FacilityFactory.new
        office_data = {
            :name=> "Clearwater",
            :address1=> "7408 E Hillsborough Ave",
            :phone=> "(813)524-4977"
        }

        expect_hash = {
            :name=> "Clearwater",
            :address=> "7408 E Hillsborough Ave",
            :phone=> "(813)524-4977"
        }

        expect(factory.construct_mo_facility_attr_helper(office_data)).to eq(expect_hash)
    end

end 