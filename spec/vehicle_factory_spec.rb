require 'rspec'
require './lib/vehicle_factory'
require './lib/vehicle'

describe VehicleFactory do


  describe '#create_vehicles' do
    it 'creates an array of vehicle from Toyota data' do
      factory = VehicleFactory.new
      toyota_data = [
        { electric_vehicle_type: "Plug-in Hybrid Electric Vehicle (PHEV)", vin_1_10: "JTDKN3DP8D", model_year: "2013", make: "TOYOTA", model: "Prius Plug-in" }
      ]

      vehicles = factory.create_vehicles(toyota_data)

      expect(vehicles.first).to be_a(Vehicle)
      expect(vehicles.first.make).to eq("TOYOTA")
      expect(vehicles.first.vin).to eq("JTDKN3DP8D")
      expect(vehicles.first.year).to eq("2013")
      expect(vehicles.first.model).to eq("Prius Plug-in")
    end
  end

  
end
