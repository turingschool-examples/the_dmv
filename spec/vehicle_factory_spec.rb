require 'spec_helper'

RSpec.describe VehicleFactory do
   before(:each) do
      @factory = VehicleFactory.new
   end
   describe '#initialize' do
      it 'can initialize' do
         expect(@factory).to be_an_instance_of VehicleFactory
      end
   end

   describe '#create_vehicles' do
      it 'can create vehicles from dmv data service' do
         wa_ev_registrations = DmvDataService.new.wa_ev_registrations
         expect(@factory.create_vehicles(wa_ev_registrations)).to be_an Array         
      end
   end   

end