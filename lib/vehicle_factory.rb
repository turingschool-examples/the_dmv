class VehicleFactory
    def initialize
    end

    def create_vehicles(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            [model:] Vehicle.new
        end
    end
end
