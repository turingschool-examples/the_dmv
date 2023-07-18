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
      #creating variable and assigning it to expect will give return value and not create two separate arrays
      #I did not unit test #create_vehicles. I was going to pull out a single object from the API
      #and run it through the method similarly to what I did in facility factory
      #but the object was A LOT of lines as a large hash
      factory_1.create_vehicles(registrations)
      created_registrations = factory_1.created_vehicles

      expect(created_registrations).to be_an Array
      expect(created_registrations.size).to eq(registrations.size) 
      expect(created_registrations).to all be_a Vehicle
    end
  end
end