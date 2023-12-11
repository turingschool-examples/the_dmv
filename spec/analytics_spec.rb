require './spec/spec_helper'

RSpec.describe Analytics do
   before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @vehicles_from_factory = @factory.create_vehicles(@wa_ev_registrations)
   end

   describe '#initialize' do
      it 'can initialize' do
         analytics = Analytics.new(@vehicles_from_factory)
         expect(analytics).to be_an_instance_of Analytics
      end
      
      it 'has an array of vehicles' do
         analytics = Analytics.new(@vehicles_from_factory)
         expect(analytics.vehicles).to be_a Array
      end
   end
end