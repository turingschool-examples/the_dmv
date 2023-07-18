require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#create vehicles" do
    it "creates vehicles based off data" do
      dmv_data_service = instance_double("DmvDataService")
      allow(dmv_data_service).to receive(:wa_ev_registrations).and_return([
      {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
      :vin_1_10=>"JTDKN3DP8D",
      :dol_vehicle_id=>"229686908",
      :model_year=>"2013",
      :make=>"TOYOTA",
      :model=>"Prius Plug-in",
      },
      {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
      :vin_1_10=>"1G1RD6E47D",
      :dol_vehicle_id=>"289314742",
      :model_year=>"2013",
      :make=>"CHEVROLET",
      :model=>"Volt",
      }

      ])

      factory = VehicleFactory.new

      vehicles = factory.create_vehicles(dmv_data_service.wa_ev_registrations
      
      expect(vehicles[0]).to be_an_instance_of(Vehicle)
      expect(vehicles[0].make).to eq("TOYOTA")
      expect(vehicles[0].model).to eq("Prius Plug-in")
      expect(vehicles[0].vin).to eq(JTDKN3DP8D)
      expect(vehicles[0].year).to eq(2013)
      expect(vehicles[0].engine).to eq(:ev)
    end
  end
end