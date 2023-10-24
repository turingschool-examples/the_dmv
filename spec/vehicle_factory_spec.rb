require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service.rb"

describe VehicleFactory do

    it "exists" do
        factory = VehicleFactory.new

        expect(factory).to be_a VehicleFactory
    end

    it "creates vehicles with API data" do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        factory.create_vehicles(wa_ev_registrations)

        expect(factory.vehicles.first).to be_a(Vehicle)
        expect(factory.vehicles.first.vin).not_to be_nil
        expect(factory.vehicles.first.year).not_to be_nil
        expect(factory.vehicles.first.make).not_to be_nil
        expect(factory.vehicles.first.model).not_to be_nil
        expect(factory.vehicles.first.engine).not_to be_nil
    end
end