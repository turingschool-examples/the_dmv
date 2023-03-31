require "spec_helper"

RSpec.describe VehicleFactory do
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
    it "can create a vehicle" do
      expect(@factory.vehicles).to eq([])
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.vehicles.first).to be_an_instance_of(Vehicle)
    end

    it "can create many vehicles" do
      @factory.create_vehicles(@wa_ev_registrations[0..9])
      expect(@factory.vehicles.count).to be > 1
    end
  end
end
