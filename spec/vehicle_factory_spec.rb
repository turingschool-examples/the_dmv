require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = VehicleFactory.new

      expect(factory).to be_a(VehicleFactory)
    end
  end 

  describe "#create_vehicles" do
    it "can create vehicles" do
      factory = VehicleFactory.new
      vehicle_1 = Vehicle.new({vin: 'JTDKN3DP8D', year: 2013, make: 'TOYOTA', model: 'Prius Plug-in', engine: :ev} )
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.create_vehicles(wa_ev_registrations)[0]).to be_a(Vehicle)
      expect(factory.create_vehicles(wa_ev_registrations)[0].vin).to eq('1G1RC6S55J')
      expect(factory.create_vehicles(wa_ev_registrations)[0].year).to eq('2018')
      expect(factory.create_vehicles(wa_ev_registrations)[0].make).to eq('CHEVROLET')
      expect(factory.create_vehicles(wa_ev_registrations)[0].model).to eq('Volt')
      expect(factory.create_vehicles(wa_ev_registrations)[0].engine).to eq(:ev)
    end
  end
end