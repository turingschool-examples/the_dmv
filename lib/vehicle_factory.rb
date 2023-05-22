class VehicleFactory
    def create_vehicles(vehicle_details)
        vehicle_details.map do |vehicle|
            vehicle_hash = {
            :vin => vehicle[:vin_1_10],
            :year => vehicle[:model_year],
            :make => vehicle[:make],
            :model => vehicle[:model],
            :engine => :ev
            }

            Vehicle.new(vehicle_hash)
        end
    end
end