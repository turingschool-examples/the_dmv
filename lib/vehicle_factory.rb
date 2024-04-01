class VehicleFactory

    def initialize
    end

    def create_vehicles(vehicle_registrations)
        format_data(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            Vehicle.new(vehicle)
        end
    end

    def format_data(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            vehicle[:engine] = :ev

            vehicle[:vin] = vehicle.delete :vin_1_10
            vehicle[:year] = vehicle.delete :model_year
        end
    end
end
