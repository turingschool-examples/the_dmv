require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @dds = DmvDataService.new
    
  end
  describe 'create a factory' do
    it 'is a factory' do
      expect(@factory).to be_an_instance_of (VehicleFactory)
    end

    it 'verify data' do
      
      wa_ev_registrations = @dds.wa_ev_registrations
    end

    it 'creates vehicles' do
      wa_ev_registrations = @dds.wa_ev_registrations
      vehicles = @factory.create_vehicles(wa_ev_registrations)
      vehicle = vehicles.first

      expect(vehicles.class).to eq (Array)
      expect(vehicle).to be_a(Vehicle)
    end
  end
end