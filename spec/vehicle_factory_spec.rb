require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"

describe "#initialize" do
  it "creates a vehicle factory" do
    factory = VehicleFactory.new
    expect(factory).to be_an_instance_of(VehicleFactory)

    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    factory.create_vehicles(wa_ev_registrations)

    expect(factory.create_vehicles(wa_ev_registrations)[0].vin).to eq("1G1RC6S55J")
    expect(factory.create_vehicles(wa_ev_registrations)[0].year).to eq("2018")
    expect(factory.create_vehicles(wa_ev_registrations)[0].make).to eq("CHEVROLET")
    expect(factory.create_vehicles(wa_ev_registrations)[0].model).to eq("Volt")
    expect(factory.create_vehicles(wa_ev_registrations)[0].engine).to eq(:ev)
  end
end
