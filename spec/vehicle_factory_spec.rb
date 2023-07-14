require 'spec_helper'

RSpec.describe VehicleFactory do
  it "exists" do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)        
  end

  it ".create_vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a Vehicle
    expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an Array
  end
end