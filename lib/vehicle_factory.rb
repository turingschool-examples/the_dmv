class VehicleFactory
    def create_vehicles(registrations)
        vehicles = []
        registrations.each do |vehicle|
            vehicles << Vehicle.new(vehicle)
        end
        vehicles
    end
end