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

  it "can find most popular vehicle in database" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    factory.find_most_common(wa_ev_registrations)

    expect(factory.find_most_common(wa_ev_registrations)).to be_a(Array)
  end

  it "can find number of vehicles by year" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    factory.count_by_year(wa_ev_registrations)

    expect(factory.count_by_year(wa_ev_registrations)).to be_a(String)
  end
end
