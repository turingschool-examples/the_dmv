require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
      expect(@wa_ev_registrations).to be_an_instance_of(Array)
    end
  end

  describe "#create_vehicles" do
    it "lists vehicles from state's DMV" do
      create_vehicles = @factory.create_vehicles(@wa_ev_registrations)
      
      expect(create_vehicles).to be_an_instance_of(Array)
      expect(create_vehicles.first.vin).to eq("7SAYGDEF6N")
      expect(create_vehicles.last.vin).to eq("7SAYGDEE5N")
    end
  end
end