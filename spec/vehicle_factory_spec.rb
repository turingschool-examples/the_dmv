require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
  end
  describe "#initialize" do
    it "initializes" do
      expect(@factory.vehicles).to be_an_instance_of(Array)
    end
  end
  
  describe "#create_vehicles" do
    it "creates_vehicles for Washington" do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
      expect(@factory.vehicles.first).to be_an_instance_of(Vehicle)
    end

    it "creates vehicles for New York" do
      expect(@factory.create_vehicles(@ny_vehicle_registrations)).to be_an_instance_of(Array)
      expect(@factory.vehicles.first).to be_an_instance_of(Vehicle)
    end
  end

  describe "#most_popular_makes_model" do
    it "can determine the most registered vehicle in Washington" do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular_makes_model).to eq("NISSAN Leaf")
    end

    it "can determine the most registered vehicle in New York" do
      @factory.create_vehicles(@ny_ev_registrations)
      expect(@factory.most_popular_makes_model).to eq("AR/CA")
    end
  end

  describe "#registrations_for_model_year" do
    it "can return count of vehicles for Washington in a specific model year" do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.registrations_for_model_year(2020)).to eq(70)
      expect(@factory.registrations_for_model_year(2018)).to eq(137)
    end

    it "can return count of vehicles for New York in a specific model year" do
      @factory.create_vehicles(@ny_ev_registrations)
      expect(@factory.registrations_for_model_year(1972)).to eq(32)
      expect(@factory.registrations_for_model_year(1999)).to eq(356)
    end
  end

  describe "#most_registered_by_county" do
    it "can return the Washington county with the most registered vehicles" do
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.most_registered_by_county(@wa_ev_registrations)).to eq("King")
    end

    it "can return the New York county with the most registered vehicles" do
      @factory.create_vehicles(@ny_ev_registrations)

      expect(@factory.most_registered_by_county(@ny_vehicle_registrations)).to eq("MONROE")
    end
  end
end