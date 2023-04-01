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
      expect(@factory.vehicles.first.vin).to be_truthy
      expect(@factory.vehicles.first.year).to be_truthy
      expect(@factory.vehicles.first.make).to be_truthy
      expect(@factory.vehicles.first.model).to be_truthy
    end

    it "can create many vehicles" do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.vehicles.count).to be > 100
      expect(@factory.vehicles.last).to be_an_instance_of(Vehicle)
      expect(@factory.vehicles.last.vin).to be_truthy
      expect(@factory.vehicles.last.year).to be_truthy
      expect(@factory.vehicles.last.make).to be_truthy
      expect(@factory.vehicles.last.model).to be_truthy
    end
  end
end
