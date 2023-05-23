class VehicleFactory


  def create_vehicles(data)
    data.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end
end