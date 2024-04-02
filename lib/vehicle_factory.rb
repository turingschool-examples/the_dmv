class VehicleFactory
    def create_vehicles(dmv_data)
        dmv_data.map do |data|
            data[:vin] = data[:vin_1_10]
            data.delete(:vin_1_10)
            data[:year] = data[:model_year]
            data.delete(:model_year)
            data[:engine] = :ev
            Vehicle.new(data)
        end
    end
end

