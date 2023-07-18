require './lib/vehicle_factory'

describe VehicleFactory do
    it "exsits" do
        factory = VehicleFactory.new

        expect(factory).to be_an_instance_of(VehicleFactory)
    end
end

describe "#create_vehicles" do
    it"takes API data and creats new vehichles" do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations

        new_vehicles = factory.create_vehicles(wa_ev_registrations)

        expect(new_vehicles).to eq(factory.create_vehicles(wa_ev_registrations))
    end
end
