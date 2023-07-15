require 'spec_helper'

RSpec.describe VehicleFactory do 
  describe "#intialize" do 
    it "exists" do 
      new_vehicle = VehicleFactory.new

      expect(new_vehicle).to be_a VehicleFactory
    end
  end

  describe "new_vehicles" do
    it "can create new vehicles" do 
      factory_1 = 

    end
  end
end