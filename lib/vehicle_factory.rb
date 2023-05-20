

class VehicleFactory
    def initialize
        #
    end

    def create_vehicles(vehicle_list)
        output = []
        vehicle_list.each do |vehicle|
            output << Vehicle.new({
                vin: vehicle[:vin_1_10], 
                year: vehicle[:model_year], 
                make: vehicle[:make], 
                model: vehicle[:model], 
                engine: :ev
                })
        end
        output
    end
end