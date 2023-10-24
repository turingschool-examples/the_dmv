class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end

    def create_vehicles(vehicle_list)
        vehicle_list.each do |vehicle_api|
            vehicle_ours = Vehicle.new(vehicle_api)
            vehicle_ours.vin = vehicle_api[:vin_1_10]
            vehicle_ours.year = vehicle_api[:model_year]
            if vehicle_api[:electric_range]
                vehicle_ours.engine = :ev
            end
            @vehicles << vehicle_ours
        end
    end
end