class VehicleFactory
    def create_vehicles(dmv_data)
        dmv_data.map do |data|
            Vehicle.new(data)
        end
    end
end

