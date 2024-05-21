require 'spec_helper'
require './lib/vehicle_factory'
require './lib/vehicle'

RSpec.describe VehicleFactory do
  describe 'create_vehicles' do
    it 'creates electric vehicles from custom registration data' do
      # Custom registration data for electric vehicles
      vehicle_data = [
        { vin: '1N4AZ1BV0R', model_year: '2024', make: 'NISSAN', model: 'Leaf' },
        { vin: 'WBAYE6C52DD', model_year: '2013', make: 'BMW', model: 'ActiveE' }
      ]
      # Create an instance of VehicleFactory
      factory = VehicleFactory.new
      # Call create_vehicles method with custom registration data
      electric_vehicles = factory.create_vehicles(vehicle_data)
      # Assert that the create_vehicles method returns an array of Vehicle instances
      expect(electric_vehicles).to be_an(Array)
      electric_vehicles.each do |vehicle|
        expect(vehicle).to be_an_instance_of(Vehicle)
        expect(vehicle.electric_vehicle?).to eq(true)
      end
    end
  end
end