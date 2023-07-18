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
    end
  end
end