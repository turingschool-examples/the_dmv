require 'spec_helper'

RSpec.describe VehicleFactory do
  it "exists" do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)        
  end

  it ".create_vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)
    expect(factory.vehicles).to all be_a Vehicle
    expect(factory.vehicles).to be_an Array
  end
end