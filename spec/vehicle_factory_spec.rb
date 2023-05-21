require 'spec_helper'

RSpec.describe VehicleFactory do 

  it "exists" do 
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end 

  it "can create new vehicle instances" do 
    @factory.create_vehicle_order({})
    expect(@factory.created_vehicles[0]).to be_an_instance_of(Vehicle)
  end 

  it "created vehicle instances are stored in an array" do 
    @factory.create_vehicle_order({})
    @factory.create_vehicle_order({})
    expect(@factory.created_vehicles).to be_an(Array)
    expect(@factory.created_vehicles.count).to eq(2)
  end 

  it "can create multiple unique vehicles at once" do 
    vehicle_array = [{vin: 98}, {make: "Lambo"}] 
    @factory.create_vehicle_order(vehicle_array)
    expect(@factory.created_vehicles[0]).to be_an_instance_of(Vehicle)
    expect(@factory.created_vehicles[1]).to be_an_instance_of(Vehicle)
    expect(@factory.created_vehicles[0].vin).to eq(98)
    expect(@factory.created_vehicles[1].make).to eq("Lambo")    
    expect(@factory.created_vehicles.count).to eq(2)
  end 

  it "sets engine type to :ev upon instance creation" do 
    vehicle_array = [{}, {}] 
    @factory.create_vehicle_order(vehicle_array)
    expect(@factory.created_vehicles[0].engine).to eq(:ev)
    expect(@factory.created_vehicles[1].engine).to eq(:ev)
  end 

  it "can set vin and year values when the key is not an identical match" do 
    @factory.create_vehicle_order({vin_10: 12, model_year: 20})
    expect(@factory.created_vehicles[0].vin).to eq(12)
    expect(@factory.created_vehicles[0].year).to eq(20)
  end 
end 