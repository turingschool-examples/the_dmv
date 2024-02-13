require './spec/spec_helper'

RSpec.describe VehicleFactory do
  it "can create vehicles from washington registrations" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    all_vehicles = factory.create_vehicles(wa_ev_registrations)
    wa_vehicle = all_vehicles.first

    expect(wa_vehicle.vin).to eq("5YJSA1H2XF")
    expect(wa_vehicle.year).to eq(2015)
    expect(wa_vehicle.make).to eq("TESLA")
    expect(wa_vehicle.model).to eq("Model S")
    expect(wa_vehicle.plate_type).to eq(:ev)
    expect(wa_vehicle.registration_date).to eq("2020-05-27T00:00:00.000")
  end

end
