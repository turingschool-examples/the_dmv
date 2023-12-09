class VehicleFactory

    def initialize
        @created_vehicles = []
    end

    def create_vehicles(registrations)
       registrations.each do |vehicle_hash|
        vehicle_data = {}
        vehicle_data[:engine] = :ev
        vehicle_data[:make] = vehicle_hash[:make]
        vehicle_data[:model] = vehicle_hash[:model]
        vehicle_data[:year] = vehicle_hash[:model_year]
        vehicle_data[:vin] = vehicle_hash[:vin_1_10]
        vehicle_data[:county] = vehicle_hash[:county]
        @created_vehicles << Vehicle.new(vehicle_data)
       end
       @created_vehicles
    end
end