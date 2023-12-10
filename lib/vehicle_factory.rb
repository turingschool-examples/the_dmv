class VehicleFactory

    def initialize
        @created_vehicles = []
        @vehicle_data = {}
    end

    def create_vehicles(registrations)
       registrations.each do |vehicle_hash|
        @vehicle_data[:engine] = :ev
        @vehicle_data[:make] = vehicle_hash[:make]
        @vehicle_data[:model] = vehicle_hash[:model]
        @vehicle_data[:year] = vehicle_hash[:model_year]
        @vehicle_data[:vin] = vehicle_hash[:vin_1_10]
        @vehicle_data[:county] = vehicle_hash[:county]
        @created_vehicles << Vehicle.new(@vehicle_data)
       end
       @created_vehicles
    end

    def create_vehicles_ny(registrations)
        registrations.each do |vehicle_hash|
            ny_engine_type(registrations)
            @vehicle_data[:make] = vehicle_hash[:"make"]
            @vehicle_data[:registration_date] = vehicle_hash[:"reg_valid_date"]
            @vehicle_data[:year] = vehicle_hash[:"model_year"]
            @vehicle_data[:vin] = vehicle_hash[:"vin"]
            @vehicle_data[:county] = vehicle_hash[:"county"]
            @created_vehicles << Vehicle.new(@vehicle_data)
        end
        @created_vehicles
    end

    def ny_engine_type(registrations)
        registrations.each do |vehicle_hash|
            if vehicle_hash[:"fuel_type"] == "GAS" || vehicle_hash[:"fuel_type"] == "PROPANE"
                @vehicle_data[:engine] = :ice
            elsif vehicle_hash[:"fuel_type"] == "ELECTRIC"
                @vehicle_data[:engine] = :ev
            else
                @vehicle_data[:engine] = nil
            end
        end
    end
end