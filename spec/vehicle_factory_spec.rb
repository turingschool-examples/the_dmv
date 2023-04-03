require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "initialize" do
    it "is can initialize" do

      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe "create vehicles" do
    it "can create vehicles" do

    expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Array)
    expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_a(Vehicle)
    end
  end
end