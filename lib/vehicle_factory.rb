class VehicleFactory

    attr_reader :name

    def initialize
        # @name = name
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