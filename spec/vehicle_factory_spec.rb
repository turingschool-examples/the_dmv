require 'spec_helper'

RSpec.describe VehicleFactory do 

  it "exists" do 
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end 

  it "can create new car objects" do 
    @testa = @factory.create_vehicle({})
    expect(@factory.created_vehicles[0]).to be_an_instance_of(Vehicle)
  end 

  xit "returns created vehicles in an array" do 
    @testa = @factory.create_vehicle({})
    @testa_2 = @factory.create_vehicle({})
    expect(@factory.create_vehicles(@testa, @testa_2)).to eq([@testa, @testa_2])
  end 

end 