class VehicleFactory
    def initialize
    end

    def create_vehicles(data)
        data.map do |vehicle_data|
            vehicle_attributes = {}
    
            vehicle_attributes[:make] = vehicle_data[:make]
            vehicle_attributes[:model] = vehicle_data[:model]
            vehicle_attributes[:engine] = :ev
            vehicle_attributes[:vin] = vehicle_data[:vin_1_10]
            vehicle_attributes[:year] = vehicle_data[:model_year]

            Vehicle.new(vehicle_attributes)
        end
    end






end