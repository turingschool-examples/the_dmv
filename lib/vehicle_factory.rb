class VehicleFactory 
    attr_reader :created_vehicles
    attr_accessor 

    def initialize
        @created_vehicles = []
    end 
end 

def create_vehicles(registrations) 
    registrations.each do |vehicle_hash| 
        vehicle_info = {}
        vehicle_info[:engine] = :ev 
        vehicle_info[:vin] = vehicle_info[:vin_1_10]
        vehicle_info[:year] = vehicle_info[:model_year]
        vehicle_info[:make] = vehicle_info[:make]
        vehicle_info[:model] = vehicle_info[:model]
        @created_vehicles << Vehicle.new(vehicle_info)
    end 
    @created_vehicles
end 