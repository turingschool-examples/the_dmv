require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it "can create vehicles from registrations" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    all_vehicles = factory.create_vehicles(wa_ev_registrations)
    single_vehicle = all_vehicles.first

    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
    expect(single_vehicle.vin).to eq("5YJSA1H2XF")
  end
end
