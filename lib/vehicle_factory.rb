class VehicleFactory

    def create_vehicles(registration)
        registration.map do |registration|
            registration[:vin] = registration[:vin_1_10]
            registration[:year] = registration[:model_year]
            registration[:engine] = :ev
            Vehicle.new(registration)
        end
    end
end
