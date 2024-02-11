require 'pry'

class VehicleFactory
    def initialize

    end

    def create_vehicles(registration_data)
        registration_data.map do |info|
            vehicle_details = {
                vin: info[:vin_1_10], 
                year: info[:model_year], 
                make: info[:make], 
                model: info[:model], 
                engine: :ev}

            Vehicle.new(vehicle_details)
        end
    end
end

