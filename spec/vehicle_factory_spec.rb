require 'spec_helper'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
  before :each do
    @factory = VehicleFactory.new
  end

  it 'is instance object of VehicleFactory' do
    expect(@factory = VehicleFactory.new).to be_an_instance_of(VehicleFactory)
    expect(@factory.factory_vehicles).to eq([])
    expect(@factory.vehicle_data[:engine]).to eq(:ev)
    
  end

  it 'creates vehicles' do
    api_data = [
      {vin: '12345', make: 'Toyota', model: 'Prius Plug-in', year: 2013},
      {vin: '67890', make: 'Nissan', model: 'Leaf', year: 2018}
    ]

    @factory.create_vehicles(api_data)

    vehicles = @factory.factory_vehicles
      expect(vehicles.size).to eq(2)

      vehicle_1 = vehicles[0]
      expect(vehicle_1.vin).to eq('12345')
      expect(vehicle_1.make).to eq('Toyota')
      expect(vehicle_1.model).to eq('Prius Plug-in')
      expect(vehicle_1.year).to eq(2013)

      vehicle_2 = vehicles[1]
      expect(vehicle_2.vin).to eq('67890')
      expect(vehicle_2.make).to eq('Nissan')
      expect(vehicle_2.model).to eq('Leaf')
      expect(vehicle_2.year).to eq(2018)
  end
end