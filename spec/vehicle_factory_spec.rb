require 'spec_helper'

RSpec.describe VehicleFactory do

    it "can generate array of Vehicle objects from DMV Data Service" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.create_vehicles(wa_ev_registrations)[0]).to be_instance_of(Vehicle)
    end
end