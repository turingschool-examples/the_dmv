require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe "#initialize" do
    it "initializes" do
      expect(@factory.vehicles).to be_an_instance_of(Array)
    end
  end
  
  describe "#create_vehicles" do
    it "creates_vehicles" do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
      expect(@factory.vehicles.first).to be_an_instance_of(Vehicle)
    end
  end

  describe "#most_popular_makes_model" do
    it "can determine the most registered vehicle" do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular_makes_model).to eq("NISSAN Leaf")
    end
  end

  describe "#registrations_for_model_year" do
    it "can return count of vehicles in a specific model year" do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.registrations_for_model_year(2020)).to eq(70)
      expect(@factory.registrations_for_model_year(2018)).to eq(137)
    end
  end

  describe "#most_registered_by_county" do
    it "can return the county with the most registered vehicles" do
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.most_registered_by_county).to eq("King")
    end
  end
end