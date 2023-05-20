require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#creat_vehicles(vehicles)' do
    it 'can create vehicles from give database' do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an(Array)
      expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_a(Vehicle)
    end
  end
end