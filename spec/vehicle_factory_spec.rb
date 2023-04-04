require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    it 'exists' do
      factory = VehicleFactory.new

      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe 'create vehicles from wa list' do
    it 'creates new vehicles from wa' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      new_cars = factory.create_vehicles(wa_ev_registrations)
      expect(new_cars[0].make).to eq("SMART")
      expect(new_cars[1].make).to eq("SMART")
      expect(new_cars[2].make).to eq("VOLKSWAGEN")
      expect(new_cars[3].make).to eq("VOLKSWAGEN")
      expect(new_cars[10].make).to eq("CHEVROLET")
    end
  end
end