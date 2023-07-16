require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = VehicleFactory.new
      
      expect(factory).to be_a(VehicleFactory)
    end
  end 

  describe "#create_vehicles" do
    xit "can create vehicles" do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      expect(factory.create_vehicles(wa_ev_registrations)).to eq(@wa_ev_registrations)
    end
  end
end