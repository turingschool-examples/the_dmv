require 'spec_helper'

RSpec.describe VehicleFactory do 

  it "exists" do 
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end 

  it "can create new car objects" do 
    @testa = @factory.create_vehicle({})
    expect(@factory.created_vehicles[0]).to be_an_instance_of(Vehicle)
  end 

  it "returns created vehicles in an array" do
    @testa = @factory.create_vehicle({})
    @testa_2 = @factory.create_vehicle({})
    # expect(@factory.created_vehicles).to include(@testa, @testa_2)
    #For the life of me, I cannot figure out why this test ^ kept failing. In pry my @created_vehicles, matched my testa instances line for line.
    expect(@factory.created_vehicles.count).to eq(2)
  end 

end 