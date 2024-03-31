class VehicleFactory

    def initialize
    end

    def create_vehicles(vehicle_registrations)
        formatted_data = format_data(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            Vehicle.new(vehicle)
        end
    end

    def format_data(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            vehicle[:engine] = :ev
        end
    end
end

# I just need the engine type, make, model, vin, and year
