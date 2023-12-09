class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end

    def create_vehicles(registrations)
        registrations.each do |registration|
            attributes = {}
            attributes[:vin] = registration[:vin_1_10]
            attributes[:year] = registration[:model_year]
            attributes[:make] = registration[:make]
            attributes[:model] = registration[:model]
            attributes[:engine] = :ev
            vehicle = Vehicle.new(attributes)
            @vehicles << vehicle
        end
        @vehicles
    end

end