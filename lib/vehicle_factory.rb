class VehicleFactory

    def initialize
    end

    def create_vehicle(api)
        api.map do |car| 
            vehicle_details = {
            vin: car[:vin_1_10],
            year: car[:model_year],
            make: car[:make],
            model: car[:model],
            engine: :ev
            }
            Vehicle.new(vehicle_details)
        end
    end
end