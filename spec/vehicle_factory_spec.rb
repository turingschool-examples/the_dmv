require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize a factory' do
      @factory = VehicleFactory.new

      expect(@factory).to be_a(VehicleFactory)
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do
    it 'can recreate an array of vehicle objects' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.vehicles).to be_a(Array)
      expect(@factory.vehicles[0]).to be_a(Vehicle)
      expect(@factory.vehicles.length).to eq(1000)
    end
  end
end
