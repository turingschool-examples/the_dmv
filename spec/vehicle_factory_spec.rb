require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      @factory = VehicleFactory.new

      expect(@factory).to be_an_instance_of(VehicleFactory)
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.vehicles).to be_a(Array)
      expect(@factory.vehicles[0]).to be_an_instance_of(Vehicle)
    end
  end

end