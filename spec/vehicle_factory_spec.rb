require 'spec_helper'

describe VehicleFactory do
  it "exists" do
    factory = VehicleFactory.new
    
    expect(factory).to be_a(VehicleFactory)
  end

  it "can take data from an API and create vehicle objects" do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory = VehicleFactory.new
    factory.create_vehicles(wa_ev_registrations)
    
    expect(factory.vehicles.count).to eq(wa_ev_registrations.count)
  end

  it "has engines that are :ev" do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory = VehicleFactory.new
    factory.create_vehicles(wa_ev_registrations)

    expect(factory.vehicles[0].engine).to eq(:ev)
  end
end