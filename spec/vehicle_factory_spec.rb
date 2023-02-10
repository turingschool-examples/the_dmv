require './lib/vehicle/'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSPec.describe VehicleFactory do
  it "parses data into an array of vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_vehicles = factory.create_vehicles(wa_ev_registrations)

    for i in 0..wa_vehicles.length - 1
      expect wa_vehicles[0].to be_a Vehicle
    end
  end
end