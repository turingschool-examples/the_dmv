class VehicleFactory 
    attr_reader :created_vehicles

    def initialize
        @created_vehicles = []
    end 

    def create_vehicles(registrations) 
    registrations.each do |vehicle_hash| 
        vehicle_info = {}
        vehicle_info[:engine] = :ev 
        vehicle_info[:vin] = vehicle_hash[:vin_1_10]
        vehicle_info[:year] = vehicle_hash[:model_year]
        vehicle_info[:make] = vehicle_hash[:make]
        vehicle_info[:model] = vehicle_hash[:model]
        @created_vehicles << Vehicle.new(vehicle_info)
    end 
    @created_vehicles
    end 
end 