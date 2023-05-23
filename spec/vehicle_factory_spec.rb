require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
      
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(wa_ev_registrations).to be_a(Array)
      expect(wa_ev_registrations[0]).to be_a(Hash)
      expect(wa_ev_registrations[0][:electric_vehicle_type]).to be_a(String)
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicle objects' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicles = factory.create_vehicles(wa_ev_registrations)
   
      expect(vehicles).to be_a(Array)
      expect(vehicles[0]).to be_a(Vehicle)
      expect(vehicles[0].engine).to eq(:ev)
    end
  end
end  