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

  describe '#create_vehicles_ny' do
    it 'create an array of vehicle from NY data' do
      factory = VehicleFactory.new
      ny_data = [
        {:vin=>"9999236", :model_year=>"1937", :make=>"CHRY", :reg_valid_date=>"2023-05-09T00:00:00.000", :fuel_type=>"GAS" },
        {:vin=>"999747", :model_year=>"1971", :make=>"STARC", :reg_valid_date=>"2023-03-08T00:00:00.000", :fuel_type=>"NONE" },
        {:vin=>"987488", :model_year=>"1974", :make=>"ST/CR", :reg_valid_date=>"2022-08-10T00:00:00.000", :fuel_type=>"ELECTRIC" },
        {:vin=>"99906", :model_year=>"2005", :make=>"MANIT", :reg_valid_date=>"2023-06-27T00:00:00.000", :fuel_type=>"PROPANE" }
      ]
      vehicles = factory.create_vehicles_ny(ny_data)

      vehicles.zip(ny_data) do |vehicle, ny_vehicle_data|
        expect(vehicle.year).to eq (ny_vehicle_data[:model_year])
        expect(vehicle.make).to  eq (ny_vehicle_data[:make])
        expect(vehicle.registration_date).to  eq (ny_vehicle_data[:reg_valid_date])
        expect(vehicle.vin).to  eq (ny_vehicle_data[:vin])
        ny_engine_type =
          case ny_vehicle_data[:fuel_type]
            when "GAS", "PROPANE" then :ice
            when "ELECTRIC" then :ev
            else nil
          end
        expect(vehicle.engine).to eq (ny_engine_type)
      end
    end
  end
end
