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

    it "#most_popular_make" do
        ev1 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev2 = { vin_1_10: "7SAYGDEE8P", model_year: 2023, make: "TESLA", model: "Model Y" }
        ev3 = { vin_1_10: "1G1FZ6S0XK", model_year:  2023, make: "CHEVROLET", model: "Bolt EV" }
        ev4 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev5 = { vin_1_10: "7SASADDFDF", model_year:  2020, make: "TESLA", model: "Model 3" }
        ev_source_array = [ev1, ev2, ev3, ev4, ev5]
        vehicle_factory = VehicleFactory.new
        vehicles = vehicle_factory.create_vehicles(ev_source_array)

        expect(vehicle_factory.most_popular_make).to eq("TESLA")
    end

    it "#most_popular_model" do
        ev1 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev2 = { vin_1_10: "7SAYGDEE8P", model_year: 2023, make: "TESLA", model: "Model Y" }
        ev3 = { vin_1_10: "1G1FZ6S0XK", model_year:  2023, make: "CHEVROLET", model: "Bolt EV" }
        ev4 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev5 = { vin_1_10: "7SASADDFDF", model_year:  2020, make: "TESLA", model: "Model 3" }
        ev_source_array = [ev1, ev2, ev3, ev4, ev5]
        vehicle_factory = VehicleFactory.new
        vehicles = vehicle_factory.create_vehicles(ev_source_array)

        expect(vehicle_factory.most_popular_model).to eq("Model 3")
    end

    it "#count_vehicles_for_model_year" do
        ev1 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev2 = { vin_1_10: "7SAYGDEE8P", model_year: 2023, make: "TESLA", model: "Model Y" }
        ev3 = { vin_1_10: "1G1FZ6S0XK", model_year:  2023, make: "CHEVROLET", model: "Bolt EV" }
        ev4 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev5 = { vin_1_10: "7SASADDFDF", model_year:  2020, make: "TESLA", model: "Model 3" }
        ev_source_array = [ev1, ev2, ev3, ev4, ev5]
        vehicle_factory = VehicleFactory.new
        vehicles = vehicle_factory.create_vehicles(ev_source_array)

        expect(vehicle_factory.count_vehicles_for_model_year(2020)).to eq(3)
        expect(vehicle_factory.count_vehicles_for_model_year(2023)).to eq(2)
    end

    xit "#county_with_most_vehicles" do
        ev1 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev2 = { vin_1_10: "7SAYGDEE8P", model_year: 2023, make: "TESLA", model: "Model Y" }
        ev3 = { vin_1_10: "1G1FZ6S0XK", model_year:  2023, make: "CHEVROLET", model: "Bolt EV" }
        ev4 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev5 = { vin_1_10: "7SASADDFDF", model_year:  2020, make: "TESLA", model: "Model 3" }
        ev_source_array = [ev1, ev2, ev3, ev4, ev5]
        vehicle_factory = VehicleFactory.new
        vehicles = vehicle_factory.create_vehicles(ev_source_array)

        # add [:county]? sort by county => county_name frequency 
         
    end
end