require 'spec_helper'

RSpec.describe FacilityFactory do
   before(:each) do
      @factory = FacilityFactory.new
   end
   describe '#initialize' do
      it 'can initialize' do
         expect(@factory).to be_an_instance_of FacilityFactory
      end
   end

   describe '#create_facilities' do
      it 'creates Facility objects with correct attributes for Colorado data' do
         colorado = DmvDataService.new.co_dmv_office_locations
         expect(@factory.create_facilities(colorado)).to be_an Array  
      end

      it 'creates Facility objects with correct attributes for New York data' do
         ny_facilities = DmvDataService.new.ny_dmv_office_locations
         expect(@factory.create_facilities(ny_facilities)).to be_an Array
      end

      it 'creates Facility objects with correct attributes for Misouri data' do
         missouri_facilities = DmvDataService.new.mo_dmv_office_locations
         expect(@factory.create_facilities(missouri_facilities)).to be_an Array
      end
   end
   
   describe '#create_co_facility' do 
      it 'creates Facility objects with correct attributes for Colorado data' do
         colorado = DmvDataService.new.co_dmv_office_locations
                  
         facilities = @factory.create_facilities(colorado)

         expect(facilities).to all(be_a(Facility))
         expect(facilities.first.name).not_to eq(nil)
         expect(facilities.first.address).not_to eq(nil)
         expect(facilities.first.phone).not_to eq(nil)
      end
   end

   describe '#create_ny_facility' do 
      it 'creates Facility objects with correct attributes for New York data' do
         ny_facilities = DmvDataService.new.ny_dmv_office_locations

         facilities = @factory.create_facilities(ny_facilities)

         expect(facilities).to all(be_a(Facility))
         expect(facilities.first.name).not_to eq(nil)
         expect(facilities.first.address).not_to eq(nil)
         expect(facilities.first.phone).not_to eq(nil)
      end
   end

   describe '#create_mo_facility' do 
      it 'creates Facility objects with correct attributes for Misouri data' do
         missouri_facilities = DmvDataService.new.mo_dmv_office_locations

         facilities = @factory.create_facilities(missouri_facilities)

         expect(facilities).to all(be_a(Facility))
         expect(facilities.first.name).not_to eq(nil)
         expect(facilities.first.address).not_to eq(nil)
         expect(facilities.first.phone).not_to eq(nil)
      end
   end
end