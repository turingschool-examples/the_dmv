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
      it 'can create facilities from dmv data service' do
         colorado = DmvDataService.new.co_dmv_office_locations
         expect(@factory.create_facilities(colorado)).to be_an Array         
      end
   end   

end