require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"

RSpec.describe VehicleFactory do
before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
end

    describe "#Initialize" do
        it "exists" do
            expect(@factory).to be_an_instance_of (VehicleFactory)
        end

        it "starts with no vehicles" do
            expect(@factory.vehicles).to eq ([])
        end
    end
    describe "#Creates a vehicles collection" do
        it "creates a collection with no nil or empty values" do
            expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of (Array)
            expect(@factory.create_vehicles(@wa_ev_registrations).empty?).to eq(false)
            expect(@factory.create_vehicles(@wa_ev_registrations).include?(nil)).to eq(false)
            expect(@factory.vehicles.first).to eq(@factory.create_vehicles(@wa_ev_registrations).first)
        end
        it "assigns the attributes correctly" do
            expect(@factory.create_vehicles(@wa_ev_registrations).first).to be_an_instance_of (Vehicle)
            expect(@factory.create_vehicles(@wa_ev_registrations).first.vin).to eq (@wa_ev_registrations.first[:vin_1_10])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.year).to eq (@wa_ev_registrations.first[:model_year])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.make).to eq (@wa_ev_registrations.first[:make])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.model).to eq (@wa_ev_registrations.first[:model])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.engine).to eq (:ev)
            expect(@factory.create_vehicles(@wa_ev_registrations).last).to be_an_instance_of (Vehicle)
            expect(@factory.create_vehicles(@wa_ev_registrations).last.vin).to eq (@wa_ev_registrations.last[:vin_1_10])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.year).to eq (@wa_ev_registrations.last[:model_year])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.make).to eq (@wa_ev_registrations.last[:make])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.model).to eq (@wa_ev_registrations.last[:model])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.engine).to eq (:ev)
        end
    end

end