require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it "creates an array of vehicle objects with the given hash" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
      expect(factory.vehicles).to include(Vehicle)
    end
  end

  describe "#most_popular_make" do
    it "counts each make and returns a hash with counts" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle_array = factory.create_vehicles(wa_ev_registrations)
      count_hash = factory.most_popular_make(vehicle_array)
      expect(count_hash).to be_an_instance_of(Hash)
      expect(count_hash).to include("TESLA"=>334)
    end
  end

  describe "#most_popular_model" do
    it "counts each model and returns a hash with counts" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle_array = factory.create_vehicles(wa_ev_registrations)
      count_hash = factory.most_popular_model(vehicle_array)
      expect(count_hash).to be_an_instance_of(Hash)
      expect(count_hash).to include("Leaf"=>256)
    end
  end

  describe "#wa_county_with_most_registered" do
    it "ouputs which counties have how many registrations in a hash" do
      factory = VehicleFactory.new
      most_registered = factory.wa_county_with_most_registered
      expect(most_registered).to be_an_instance_of(Hash)
      expect(most_registered).to include("King"=>729)
    end
  end
end