require 'spec_helper'

Rspec.describe VehicleFactory do
  
  let(:factory) {VehicleFactory.new}}
  let(:wa_ev_registrations) { DmvDataService.new.wa_ev_registrations }
  
  describe '#create_vehicles' do
    it 'returns an array of vehicles' do
      vehicles = factory.create_vehicles(wa_ev_registrations)
      expect(vehicles).to all(be_a(Vehicle))
    end
  end
end