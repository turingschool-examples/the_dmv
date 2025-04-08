require 'spec_helper'
require 'pry'

RSpec.describe VehicleFactory do
  it 'can initialize' do
    factory = VehicleFactory.new

    expect(factory).to be_an_instance_of(VehicleFactory)

  end
  let(:wa_ev_registrations) do
      [{ 
          electric_vehicle_type: "Plug-in Hybrid Electric Vehicle (PHEV)",
          vin_1_10: "JTDKN3DP8D",
          dol_vehicle_id: "229686908",
          model_year: "2013",
          make: "TOYOTA",
          model: "Prius Plug-in"
        },
        { 
          electric_vehicle_type: "Plug-in Hybrid Electric Vehicle (PHEV)",
          vin_1_10: "1G1RD6E47D",
          dol_vehicle_id: "289314742",
          model_year: "2013",
          make: "CHEVROLET",
          model: "Volt"
        }]
        
  it 'can create evs' do
    factory = VehicleFactory.new
    @vehicles = factory.create_vehicles(wa_ev_registrations)

    expect(vehicles).to be_an(Array)
    expect(vehicles.length).to eq(2)

    first_vehicle = vehicles.first
    expect(first_vehicle).to be_an_instance_of(Vehicle)
    expect(first_vehicle.engine).to eq(:ev)
    expect(first_vehicle.make).to eq("TOYOTA")
    expect(first_vehicle.model).to eq("Prius Plug-in")
    expect(first_vehicle.vin).to eq("JTDKN3DP8D")
    expect(first_vehicle.year).to("2013")

    second_vehicle = vehicle.last
    expect(second_vehicle).to be_an_instance_of(Vehicle)
    expect(second_vehicle.engine).to eq(:ev)
    expect(second_vehicle.make).to eq("CHEVROLET")
    expect(second_vehicle.model).to eq("VOLT")
    expect(second_vehicle.vin).to eq("1G1RD6E47D")
    expect(second_vehicle.year).to("2013")

    end
  end
end