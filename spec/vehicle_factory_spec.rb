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
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.vin).to eq("7SAYGDEF6N")
      expect(@factory.create_vehicles(@wa_ev_registrations).last.vin).to eq("7SAYGDEE5N")
      expect(@factory.create_vehicles(@wa_ev_registrations).count).to eq(4000)
    end
  end
end