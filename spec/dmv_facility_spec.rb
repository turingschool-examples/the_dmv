require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"
require "./dmv_facility"

describe "#initialize" do
  it "creates a dmv factory" do
    expect(DmvDataService.new.co_dmv_office_locations).to eq([])

    colorado_facilities = DmvDataService.new.co_dmv_office_locations
    expect(colorado_facilities).to be_an_instance_of(DmvFacility)

    expect(factory.create_vehicles(wa_ev_registrations)[0].vin).to eq("1G1RC6S55J")
    expect(factory.create_vehicles(wa_ev_registrations)[0].year).to eq("2018")
    expect(factory.create_vehicles(wa_ev_registrations)[0].make).to eq("CHEVROLET")
    expect(factory.create_vehicles(wa_ev_registrations)[0].model).to eq("Volt")
    expect(factory.create_vehicles(wa_ev_registrations)[0].engine).to eq(:ev)
  end
end
