require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'exists' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe "#create_vehicles" do
    it 'can make new vehicles object instances' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      expect(factory.create_vehicles(wa_ev_registrations)).to be_an(Array)
      expect(factory.create_vehicles(wa_ev_registrations).first).to be_a(Vehicle)
    end
  end
end