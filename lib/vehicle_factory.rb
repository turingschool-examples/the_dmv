class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end

    # def create_vehicles(data_service)
    #     @vehicles = data_service.map do |vehicle_info|
    #         vehicle_info[:eng] = :ev if vehicle_info[:engine] == nil
    #         vehicle_info[:make] = vehicle_info[:make]
    #         vehicle_info[:year] = vehicle_info[:model_year]
    #         vehicle_info[:vin] = vehicle_info[1-10]
    #     end
    # end