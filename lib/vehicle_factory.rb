class VehicleFactory
    
    def create_vehicles(vehicle_details)
        vehicles_created = []
        vehicle_details.each do |vehicle|
            vehicle[:engine] = "ev"
            vehicles_created << Vehicle.new(vehicle)
        end
        vehicles_created
    end

end

