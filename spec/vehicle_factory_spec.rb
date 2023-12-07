require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#create_vehicles' do
    it 'create an array of vehicles from the given data' do
      factory = VehicleFactory.new
      data = [{:make=>"Tesla", :model=>"Model Y", :vin_1_10=>"7SAYGDEE8P", :model_year=>"2023"},
              {:make=>"Nissan", :model=>"Leaf", :vin_1_10=>"1N4BZ0CP2G", :model_year=> "2016"}]
      vehicles = factory.create_vehicles(data)

      vehicles.zip(data) do |vehicle, vehicle_data|
        expect(vehicle).to be_a (Vehicle)
        expect(vehicle.engine).to eq (:ev)
        expect(vehicle.year).to eq (vehicle_data[:model_year])
        expect(vehicle.make).to  eq (vehicle_data[:make])
        expect(vehicle.model).to  eq (vehicle_data[:model])
        expect(vehicle.vin).to  eq (vehicle_data[:vin_1_10])
      end
    end
  end
end
