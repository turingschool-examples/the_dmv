class VehicleFactory
    def initialize; end

    def create_vehicles(registrations)
        registrations.map do |car_details|
            Vehicle.new({
            vin: car_details[:vin_1_10],
            year: car_details[:model_year],
            make: car_details[:make],
            model: car_details[:model],
            engine: :ev
            })
        end
    end
end