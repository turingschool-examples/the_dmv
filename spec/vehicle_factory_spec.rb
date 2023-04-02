require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe "#initialize" do

    it "exists" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end

  end

  describe "Adding vehicles to the factory" do
    
    it "creates vehicles" do

    end

  end

end