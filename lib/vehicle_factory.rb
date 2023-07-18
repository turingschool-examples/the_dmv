class VehicleFactory
    attr_accessor :vehicle_list

    def initialize
        @vehicle_list = []
    end

    def create_vehicles(registrations)
      registrations.each do |vehicle|
        details = {
            vin: vehicle[:vin_1_10],
            year: vehicle[:model_year],
            make: vehicle[:make],
            model: vehicle[:model],
            engine: :ev
        }
        @vehicle_list << Vehicle.new(details)
      end
    end
end