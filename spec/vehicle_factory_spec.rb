require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe 'Initialize' do
    it 'exists' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe 'Create Vehicles' do
    it 'can create vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      cars = @factory.create_vehicles(wa_ev_registrations)
  
      expect(cars.length).to eq(1000)
    end
  end
end