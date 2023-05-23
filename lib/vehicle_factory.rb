class VehicleFactory 

    def initialize 
    end

    def create_vehicles(locations)
        new_vehicles = Vehicle.new({vin: locations[:vin_1_10], year: locations[:model_year], make: locations[:make], model: locations[:model], engine: [:ev]})
    end
end
