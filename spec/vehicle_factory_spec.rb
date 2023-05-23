require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#exists' do
    it 'can initialize' do

      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#reads registry' do
    it 'can read API' do

      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      vehicles = factory.create_vehicles(wa_ev_registrations)
      # require 'pry'; binding.pry
      expect(vehicles).to be_a(Array)
      expect(vehicles[0].make).to eq("TESLA")
      expect(vehicles[0].model).to eq("Model Y")
      expect(vehicles[0].year).to eq("2022")

      expect(vehicles[1].make).to eq("KIA")
      expect(vehicles[1].model).to eq("Niro")
      expect(vehicles[1].year).to eq("2022")
    end
  end
end