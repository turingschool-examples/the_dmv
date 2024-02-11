class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end

    def create_vehicles(data_service)
        @vehicles = data_service.map do |vehicle_info|
        vehicle_info[:engine] = :ev if vehicle_info[:engine] == nil
        vehicle_info[:make] = vehicle_info[:make]
        vehicle_info[:model] = vehicle_info[:model]
        vehicle_info[:plate_type] = nil
        vehicle_info[:registration_date] = nil
        vehicle_info[:vin] = vehicle_info[:vin_1_10]
        vehicle_info[:year] = vehicle_info[:model_year]
        
        end
    end
end