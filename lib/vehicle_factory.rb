class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end

    def create_vehicles(data)
        data.find_all do |vehicle|
            vehicle
        end
    end
end