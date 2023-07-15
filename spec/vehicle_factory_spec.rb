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
      factory_1 = VehicleFactory.new
      registrations = DmvDataService.new.wa_ev_registrations
      # require 'pry';binding.pry
      expect(factory_1.create_vehicles(registrations)).to be_an Array

      expect(factory_1.created_vehicles.length).to eq(registrations.size)

      expect(factory_1.create_vehicles(registrations)).to all be_a Vehicle
    end
  end
end