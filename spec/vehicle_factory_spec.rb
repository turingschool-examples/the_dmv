require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'pry'

RSpec.describe VehicleFactory do
  it "exists" do
    factory = VehicleFactory.new

    expect(factory).to be_a(VehicleFactory)
  end

  it "has access to WA state EV registrations" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(wa_ev_registrations).to be_a(Array)
  end

  it "can make vehicles from WA EV registration data" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    factory.create_vehicles(wa_ev_registrations)
    
    expect(factory.create_vehicles(wa_ev_registrations)).to be_a(Array)
  end
end
