require 'spec_helper'

describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe "#create_vehicles" do
    it "can add vehicles from the database" do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an Array
      expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a Vehicle
    end
  end
end