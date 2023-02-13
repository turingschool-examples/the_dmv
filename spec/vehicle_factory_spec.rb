require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'exists' do
    
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do    #my before(:each) decided to not work here and I couldn't figure out why
    it 'can create vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      new_vehicles = factory.create_vehicles(wa_ev_registrations)
      expect(new_vehicles.size).to eq(1000)
      expect(new_vehicles[0]).to be_a(Vehicle)
      expect(new_vehicles[1]).to be_a(Vehicle)
      expect(new_vehicles[2]).to be_a(Vehicle)
    end
  end
end
