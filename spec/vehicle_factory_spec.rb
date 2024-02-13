require './spec/spec_helper'

RSpec.describe VehicleFactory do
  it "can create vehicles from registrations" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    all_vehicles = factory.create_vehicles(wa_ev_registrations)
    single_vehicle = all_vehicles.first

    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
    expect(single_vehicle.year).to eq(2015)
    expect(single_vehicle.make).to eq("TESLA")
    expect(single_vehicle.model).to eq("Model S")
    expect(single_vehicle.plate_type).to eq(:ev)
    expect(single_vehicle.registration_date).to eq("2020-05-27T00:00:00.000")
  end
end
