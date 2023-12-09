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
         wa_ev_registrations = DmvDataService.new.wa_ev_registrations
         expect(@factory.create_facilities(wa_ev_registrations)).to be_an Array         
      end
   end   

end