require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @vehicle_factory = VehicleFactory.new
    @registrations = [
      {make: 'Tesla', model: 'Model S', vin_1_10: '5YJSA1CN', model_year: 2015},
      {make: 'Tesla', model: 'Model 3', vin_1_10: '5YJ3E1EA', model_year: 2018},
      {make: 'Tesla', model: 'Model X', vin_1_10: '5YJXCBEA', model_year: 2017}
    ]
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@vehicle_factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicle' do 
    it 'can create a vehicle' do
      vehicles = @vehicle_factory.create_vehicle(@registrations)
      expect(vehicles[0].make).to eq('Tesla')
      expect(vehicles[0].model).to eq('Model S')
      expect(vehicles[0].vin).to eq('5YJSA1CN')
      expect(vehicles[0].year).to eq(2015)
      expect(vehicles[0].engine).to eq(:ev)
      expect(vehicles[0].registration_date).to eq(nil)
      expect(vehicles[0].plate_type).to eq(nil)
    end
  end

  describe '#create_vehicle to inheret Vehicle' do
    it 'can create a vehicle' do
      vehicles = @vehicle_factory.create_vehicle(@registrations)
      expect(vehicles[0]).to be_an_instance_of(Vehicle)
    end
  end

  describe '#create_vehicle to inheret Vehicle methods' do
    it 'can create a vehicle' do
      vehicles = @vehicle_factory.create_vehicle(@registrations)
      expect(vehicles[0].antique?).to eq(false)
      expect(vehicles[0].electric_vehicle?).to eq(true)
      expect(vehicles[0].regular?).to eq(false)
      vehicles[0].set_plate_type
      expect(vehicles[0].plate_type).to eq(:ev)
    end
  end
end