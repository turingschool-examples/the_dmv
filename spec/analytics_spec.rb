require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"
require "./lib/analytics"

RSpec.describe Analytics do
    xit "#most_popular_make" do
        ev1 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev2 = { vin_1_10: "7SAYGDEE8P", model_year: 2023, make: "TESLA", model: "Model Y" }
        ev3 = { vin_1_10: "1G1FZ6S0XK", model_year:  2023, make: "CHEVROLET", model: "Bolt EV" }
        ev4 = { vin_1_10: "5YJ3E1EC6L", model_year: 2020, make: "TESLA", model: "Model 3" }
        ev5 = { vin_1_10: "7SASADDFDF", model_year:  2020, make: "TESLA", model: "Model 3" }
        ev_source_array = [ev1, ev2, ev3, ev4, ev5]
        vehicle_factory = VehicleFactory.new
        vehicles = vehicle_factory.create_vehicles(ev_source_array)

        expect(vehicles.most_popular_make).to eq("Model 3")
    end


end