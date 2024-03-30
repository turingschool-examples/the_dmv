class VehicleFactory

    def initialize
    end

    def create_vehicles(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            Vehicle.new(vehicle)
        end
    end
end

# I just need the engine type, make, model, vin, and year
