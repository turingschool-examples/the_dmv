class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end

    def create_vehicles(vehicle_list)

        vehicle_list.each do |vehicle|
            @vehicles << Vehicle.new(vehicle)
        end
    end
end