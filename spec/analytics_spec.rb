require './spec/spec_helper'

RSpec.describe Analytics do
   before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @washington_ev_vehicles = @factory.create_vehicles(@wa_ev_registrations)
      @analytics = Analytics.new
   end

   describe '#initialize' do
      it 'can initialize' do
         expect(@analytics).to be_an_instance_of Analytics
      end
   end

   describe '#vehicle_models' do
      it 'return an array with all the different models' do
         expect(@analytics.vehicle_models(@washington_ev_vehicles)).to be_an Array
      end
   end

   describe '#model_count' do
      it 'return a Hash with model as keys and the count as value' do
         expect(@analytics.model_count(@washington_ev_vehicles)).to be_a Hash
      end
   end

   describe '#most_popular_model' do
      it 'can filter vehicles and find the most popular' do
         expect(@analytics.most_popular_model(@washington_ev_vehicles)).not_to be nil
      end
   end

   describe '#vehicle_makes' do
      it 'return an array with all the different models' do
         expect(@analytics.vehicle_maker(@washington_ev_vehicles)).to be_an Array
      end
   end

   describe '#make_count' do
      it 'return a Hash with make as keys and the count as value' do
         expect(@analytics.make_count(@washington_ev_vehicles)).to be_a Hash
      end
   end

   describe '#most_popular_make' do
      it 'can filter vehicles and find the most popular make' do
         expect(@analytics.most_popular_make(@washington_ev_vehicles)).not_to be nil
      end
   end

   describe '#count_by_year' do
      it 'returns the count of vehicles by year given' do
         expect(@analytics.count_by_year(@washington_ev_vehicles, "2020")).to be_an Integer
      end
   end
end