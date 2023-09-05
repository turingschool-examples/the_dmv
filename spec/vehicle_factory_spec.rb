require 'spec_helper'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
  before :each do
    @factory = VehicleFactory.new
    @dmv_data_service = DmvDataService.new
    @api_data = @dmv_data_service.wa_ev_registrations
  end

  it 'is instance object of VehicleFactory' do
    expect(@factory = VehicleFactory.new).to be_an_instance_of(VehicleFactory)
    expect(@factory.factory_vehicles).to eq([])
    expect(@factory.vehicle_data[:engine]).to eq(:ev)
    
  end

  it 'creates vehicles' do
    @factory.create_vehicles(@api_data)

    vehicles = @factory.factory_vehicles
      expect(vehicles.size).to eq(1000)

      vehicle_1 = vehicles[0]
      expect(vehicle_1.vin).to eq('1N4AZ0CPXF')
      expect(vehicle_1.make).to eq('NISSAN')
      expect(vehicle_1.model).to eq('Leaf')
      expect(vehicle_1.year).to eq("2015")

      vehicle_2 = vehicles[1]
      expect(vehicle_2.vin).to eq('5YJ3E1EB6K')
      expect(vehicle_2.make).to eq('TESLA')
      expect(vehicle_2.model).to eq('Model 3')
      expect(vehicle_2.year).to eq("2019")  
  end
end