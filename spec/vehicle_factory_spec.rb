require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"

RSpec.describe VehicleFactory do
before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @ny_registrations = DmvDataService.new.ny_registrations
end

    describe "#Initialize" do
        it "exists" do
            expect(@factory).to be_an_instance_of (VehicleFactory)
        end
    end
    describe "#Creates a vehicles collection" do
        it "creates a collection with no nil or empty values" do
            expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of (Array)
            expect(@factory.create_vehicles(@wa_ev_registrations).empty?).to eq(false)
            expect(@factory.create_vehicles(@wa_ev_registrations).include?(nil)).to eq(false)
            expect(@factory.create_vehicles(@wa_ev_registrations)).to all(be_an_instance_of Vehicle)
        end
        it "assigns the attributes correctly" do
            expect(@factory.create_vehicles(@wa_ev_registrations).first.vin).to eq (@wa_ev_registrations.first[:vin_1_10])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.year).to eq (@wa_ev_registrations.first[:model_year])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.make).to eq (@wa_ev_registrations.first[:make])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.model).to eq (@wa_ev_registrations.first[:model])
            expect(@factory.create_vehicles(@wa_ev_registrations).first.engine).to eq (:ev)
            expect(@factory.create_vehicles(@wa_ev_registrations).first.county).to eq ("King")
            expect(@factory.create_vehicles(@wa_ev_registrations).last.vin).to eq (@wa_ev_registrations.last[:vin_1_10])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.year).to eq (@wa_ev_registrations.last[:model_year])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.make).to eq (@wa_ev_registrations.last[:make])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.model).to eq (@wa_ev_registrations.last[:model])
            expect(@factory.create_vehicles(@wa_ev_registrations).last.engine).to eq (:ev)
            expect(@factory.create_vehicles(@wa_ev_registrations).last.county).to eq ("King")
        end
    end

    describe "#Creates a vehicles collection for NY locations" do
        it "creates a collection with no empty values" do
            expect(@factory.create_vehicles(@ny_registrations)).to be_an_instance_of (Array)
            expect(@factory.create_vehicles(@ny_registrations).empty?).to eq(false)
            expect(@factory.create_vehicles(@ny_registrations).flatten.include?(nil)).to eq(false)
            
            expect(@factory.create_vehicles(@ny_registrations)).to all(be_an_instance_of Vehicle)
        end
        it "assigns the attributes correctly" do
            ny_vehicles = @factory.create_vehicles(@ny_registrations)
            expect(ny_vehicles.first.first.vin).to eq (@ny_registrations[1][:"vin"])
            expect(ny_vehicles.first.first.year).to eq (@ny_registrations[1][:"model_year"])
            expect(ny_vehicles.first.first.make).to eq (@ny_registrations[1][:"make"])
            expect(ny_vehicles.first.first.model).to eq (@ny_registrations[1][:"body_type"])
            expect(ny_vehicles.first.first.engine).to eq (@ny_registrations[1][:"fuel_type"])
            expect(ny_vehicles.first.first.county).to eq (@ny_registrations[1][:"county"])
        end
    end

end