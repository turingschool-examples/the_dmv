require 'spec_helper'

RSpec.describe FacilityMaker do
    describe '#initialize' do
        it 'creates a facility object' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            facility_maker = FacilityMaker.new(co_dmv_office_locations)
binding.pry
            expect(facility_maker).to be_a(FacilityMaker)
        end
    end

    describe '#data_organizer_co' do
        it 'stores data from external source in all necessary keys' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            facility_maker = FacilityMaker.new(co_dmv_office_locations)

            facility_maker.data_organizer_co

            expect(facility_maker.new_facility_data[:name]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:address]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:phone]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:hours]).not_to eq(nil)
        end
    end
    describe '#facility_maker_co' do
        it 'does not create colorado facilities unless it recieves colorado dmv data' do
            ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
            facility_maker = FacilityMaker.new(ny_dmv_office_locations)

            facility_maker.facility_maker_co

            expect(facility_maker.new_facilities.first).not_to be_a(Facility)
            expect(facility_maker.new_facilities.last).not_to be_a(Facility)
        end

        it 'stores data for colorado facilities in new facility objects' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            facility_maker = FacilityMaker.new(co_dmv_office_locations)

            facility_maker.facility_maker_co

            expect(facility_maker.new_facilities.first.name).not_to eq(nil)
            expect(facility_maker.new_facilities.first.address).not_to eq(nil)
            expect(facility_maker.new_facilities.first.phone).not_to eq(nil)
            expect(facility_maker.new_facilities.first.services).not_to eq([])
            expect(facility_maker.new_facilities.first.registered_vehicles).to eq([])
            expect(facility_maker.new_facilities.first.collected_fees).to eq(0)
            expect(facility_maker.new_facilities.last.name).not_to eq(nil)
            expect(facility_maker.new_facilities.last.address).not_to eq(nil)
            expect(facility_maker.new_facilities.last.phone).not_to eq(nil)
            expect(facility_maker.new_facilities.last.services).not_to eq([])
            expect(facility_maker.new_facilities.last.registered_vehicles).to eq([])
            expect(facility_maker.new_facilities.last.collected_fees).to eq(0)
        end
    end

    describe '#data_organizer_ny' do
        it 'stores data from external source in all necessary keys' do
            ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
            facility_maker = FacilityMaker.new(ny_dmv_office_locations)

            facility_maker.data_organizer_ny

            expect(facility_maker.new_facility_data[:name]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:address]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:phone]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:hours]).not_to eq(nil)
        end
    end

    describe '#facility_maker_ny' do
        it 'does not create New York facilities unless it recieves New York dmv data' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            facility_maker = FacilityMaker.new(co_dmv_office_locations)

            facility_maker.facility_maker_ny

            expect(facility_maker.new_facilities.first).not_to be_a(Facility)
            expect(facility_maker.new_facilities.last).not_to be_a(Facility)
        end

        it 'stores data for New York facilities in new facility objects' do
            ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
            facility_maker = FacilityMaker.new(ny_dmv_office_locations)

            facility_maker.facility_maker_ny

            expect(facility_maker.new_facilities.first.name).not_to eq(nil)
            expect(facility_maker.new_facilities.first.address).not_to eq(nil)
            expect(facility_maker.new_facilities.first.phone).not_to eq(nil)
            expect(facility_maker.new_facilities.first.registered_vehicles).to eq([])
            expect(facility_maker.new_facilities.first.collected_fees).to eq(0)
            expect(facility_maker.new_facilities.last.name).not_to eq(nil)
            expect(facility_maker.new_facilities.last.address).not_to eq(nil)
            expect(facility_maker.new_facilities.last.phone).not_to eq(nil)
            expect(facility_maker.new_facilities.last.registered_vehicles).to eq([])
            expect(facility_maker.new_facilities.last.collected_fees).to eq(0)
        end
    end

    describe '#data_organizer_mo' do
        it 'stores data from external source in all necessary keys' do
            mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
            facility_maker = FacilityMaker.new(mo_dmv_office_locations)

            facility_maker.data_organizer_mo

            expect(facility_maker.new_facility_data[:name]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:address]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:phone]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:hours]).not_to eq(nil)
            expect(facility_maker.new_facility_data[:holiday_closures]).not_to eq(nil)
        end
    end

    describe '#facility_maker_mo' do
        it 'does not create Missouri facilities unless it recieves Missouri dmv data' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            facility_maker = FacilityMaker.new(co_dmv_office_locations)

            facility_maker.facility_maker_mo

            expect(facility_maker.new_facilities.first).not_to be_a(Facility)
            expect(facility_maker.new_facilities.last).not_to be_a(Facility)
        end

        it 'stores data for Missouri facilities in new facility objects' do
            mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
            facility_maker = FacilityMaker.new(mo_dmv_office_locations)

            facility_maker.facility_maker_mo

            expect(facility_maker.new_facilities.first.name).not_to eq(nil)
            expect(facility_maker.new_facilities.first.address).not_to eq(nil)
            expect(facility_maker.new_facilities.first.phone).not_to eq(nil)
            expect(facility_maker.new_facilities.first.registered_vehicles).to eq([])
            expect(facility_maker.new_facilities.first.collected_fees).to eq(0)
            expect(facility_maker.new_facilities.last.name).not_to eq(nil)
            expect(facility_maker.new_facilities.last.address).not_to eq(nil)
            expect(facility_maker.new_facilities.last.phone).not_to eq(nil)
            expect(facility_maker.new_facilities.last.registered_vehicles).to eq([])
            expect(facility_maker.new_facilities.last.collected_fees).to eq(0)
        end
    end

    describe '#facility_maker' do
        it 'can create facilities with MO, CO, or NY data sets' do
            mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
            facility_creator = FacilityMaker.new(mo_dmv_office_locations)

            facility_creator.facility_maker

            expect(facility_creator.new_facilities.first).to be_a(Facility)
            expect(facility_creator.new_facilities.first.name).not_to eq(nil)
            expect(facility_creator.new_facilities.last.phone).not_to eq(nil)
            expect(facility_creator.new_facilities.last.address).not_to eq(nil)

            ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
            facility_creator_1 = FacilityMaker.new(ny_dmv_office_locations)

            facility_creator_1.facility_maker

            expect(facility_creator_1.new_facilities.first).to be_a(Facility)
            expect(facility_creator_1.new_facilities.first.name).not_to eq(nil)
            expect(facility_creator_1.new_facilities.last.phone).not_to eq(nil)
            expect(facility_creator_1.new_facilities.last.address).not_to eq(nil)

            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            facility_creator_2 = FacilityMaker.new(co_dmv_office_locations)

            facility_creator_2.facility_maker

            expect(facility_creator_2.new_facilities.first).to be_a(Facility)
            expect(facility_creator_2.new_facilities.first.name).not_to eq(nil)
            expect(facility_creator_2.new_facilities.last.phone).not_to eq(nil)
            expect(facility_creator_2.new_facilities.last.address).not_to eq(nil)
        end
    end
end