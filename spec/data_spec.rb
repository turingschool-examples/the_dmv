require 'spec_helper'
RSpec.describe Create do
    before(:each) do
      @data = Create.new
    end
    describe '#initialize' do
      it 'can initialize' do
        expect(@data).to be_an_instance_of(Create)
        expect(@data.facilities).to eq([])
        expect(@data.vehicles).to eq([])
      end
    end

      describe '#create facility' do
        it 'can create facilities' do
            or_facilities = DmvDataService.new.or_dmv_office_locations
            new_york_facilities = DmvDataService.new.ny_dmv_office_locations
            missouri_facilities = DmvDataService.new.mo_dmv_office_locations
            expect(@data.create_facility(new_york_facilities).first.address).to eq("168-46 91ST AVE., 2ND FLR, JAMAICA, NY 11432")
            expect(@data.create_facility(new_york_facilities).first.collected_fees).to eq(0)
            expect(@data.create_facility(new_york_facilities).first.name).to eq("JAMAICA KIOSK")
            expect(@data.create_facility(new_york_facilities).first.phone).to eq(nil)
        end
            it 'can create facilities' do
    
                missouri_facilities = DmvDataService.new.mo_dmv_office_locations
            
            expect(@data.create_facility(missouri_facilities).first.address).to eq("3164 TELEGRAPH ROAD, ST LOUIS, MO 63125")
            expect(@data.create_facility(missouri_facilities).first.collected_fees).to eq(0)
            expect(@data.create_facility(missouri_facilities).first.name).to eq("OAKVILLE")
            expect(@data.create_facility(missouri_facilities).first.phone).to eq("(314) 730-0606")
            end
            
                it 'can create facilities' do
                    or_facilities = DmvDataService.new.or_dmv_office_locations
            expect(@data.create_facility(or_facilities).first.address).to eq("2242 Santiam Hwy SE, Albany, OR 97321")
            expect(@data.create_facility(or_facilities).first.collected_fees).to eq(0)
            expect(@data.create_facility(or_facilities).first.name).to eq("Albany DMV Office")
            expect(@data.create_facility(or_facilities).first.phone).to eq("541-967-2014")
            

        end
    end
    describe '#vehicle factory' do
        it 'can create vehicles' do
           vehicles= DmvDataService.new.wa_ev_registrations

            expect(@data.vehicle_factory(vehicles).first.vin).to eq("7SAYGDEF6N")
            expect(@data.vehicle_factory(vehicles).first.make).to eq("TESLA")
            expect(@data.vehicle_factory(vehicles).first.model).to eq("Model Y")
            expect(@data.vehicle_factory(vehicles).first.year).to eq("2022")
            
        end
    end
end

