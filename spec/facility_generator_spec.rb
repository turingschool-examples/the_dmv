require 'spec_helper'

RSpec.describe FacilityGenerator do

    it "can generate an array of Facility objects from data input" do
        generator = FacilityGenerator.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

        expect(generator.create_facilities(co_dmv_office_locations)[0]).to be_instance_of(Facility)
    end

    it "won't return nil for key values" do
        generator = FacilityGenerator.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

        expect(generator.create_facilities(co_dmv_office_locations)[0].name).not_to eq(nil)
        expect(generator.create_facilities(co_dmv_office_locations)[0].address).not_to eq(nil)
        expect(generator.create_facilities(co_dmv_office_locations)[0].phone).not_to eq(nil)
        expect(generator.create_facilities(ny_dmv_office_locations)[0].name).not_to eq(nil)
        expect(generator.create_facilities(ny_dmv_office_locations)[0].address).not_to eq(nil)
        expect(generator.create_facilities(ny_dmv_office_locations)[0].phone).not_to eq(nil)
        expect(generator.create_facilities(mo_dmv_office_locations)[0].name).not_to eq(nil)
        expect(generator.create_facilities(mo_dmv_office_locations)[0].address).not_to eq(nil)
        expect(generator.create_facilities(mo_dmv_office_locations)[0].phone).not_to eq(nil)
    end
end