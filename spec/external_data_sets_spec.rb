require 'spec_helper'

RSpec.describe 'Vehicle Factory' do
  describe 'exists' do
    it '#is an instance of' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe 'accesses the API' do
    it 'can create vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      created_vehicles = factory.create_vehicles(wa_ev_registrations)
      
      expect(created_vehicles).to be_a(Array)
      expect(created_vehicles.first).to be_a(Vehicle)
      expect(created_vehicles.length).to be(1000)

    end
  end
end