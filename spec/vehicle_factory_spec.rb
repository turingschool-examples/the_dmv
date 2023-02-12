require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'exists' do 
      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory) 
    end
  end

  describe '#create_vehicles' do
    it 'has creates cars from wa_registration info' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)

      expect(wa_ev_registrations).to be_an_instance_of(Array)
      expect(wa_ev_registrations.size).to eq(1000) 
      expect(factory.factory_vehicles).to be_an_instance_of(Array)
      expect(factory.factory_vehicles.size).to eq(1000)
    end
  end
end