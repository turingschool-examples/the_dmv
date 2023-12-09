require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"

RSpec.describe do
    it "exists" do
        factory = VehicleFactory.new

        expect(factory).to be_an_instance_of VehicleFactory
    end

    it "#create_vehicles" do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations

        expect(factory.create_vehicles(wa_ev_registrations)).to be_a Array
        expect(factory.create_vehicles(wa_ev_registrations).first).to be_instance_of(Vehicle)
        expect(factory.create_vehicles(wa_ev_registrations).first.engine).to eq(:ev)
        expect(factory.create_vehicles(wa_ev_registrations).first.registration_date).to eq(nil)
        expect(factory.create_vehicles(wa_ev_registrations).first.plate_type).to eq(nil)
        expect(factory.create_vehicles(wa_ev_registrations).first.vin).not_to be(nil)
        expect(factory.create_vehicles(wa_ev_registrations).first.year).not_to be(nil)
        expect(factory.create_vehicles(wa_ev_registrations).first.make).not_to be(nil)
        expect(factory.create_vehicles(wa_ev_registrations).first.model).not_to be(nil)
    end
end