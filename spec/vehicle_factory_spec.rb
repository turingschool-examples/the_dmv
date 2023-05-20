require 'spec_helper'

RSpec.describe VehicleFactory do 

  it "exists" do 
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end 

  xit "can create new car objects" do 
    @factory.create_vehicle(@testa) 
    expect(@testa).to be_an_instance_of(Vehicle)
  end 

  xit "returns created vehicles in an array" do 
    expect(factory.create_vehicles(@testa, @testa_2)).to eq([@testa, @testa_2])
  end 

end 