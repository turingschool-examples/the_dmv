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
         @vehicles_array = @factory.create_vehicles(wa_ev_registrations)
         
         expect(@vehicles_array).to be_an Array
         
         expect(@vehicles_array).to all(be_a(Vehicle))
         expect(@vehicles_array.first.make).not_to eq(nil)
         expect(@vehicles_array.first.model).not_to eq(nil)
         expect(@vehicles_array.first.year).not_to eq(nil) 
         expect(@vehicles_array.first.vin).not_to eq(nil) 
         expect(@vehicles_array.first.engine).not_to eq(nil) 
      end
   end   

end