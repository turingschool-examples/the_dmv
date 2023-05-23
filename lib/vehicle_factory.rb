class VehicleFactory

  def create_vehicles(dmv_vehicles_data)
    dmv_vehicles_data.map do |vehicle_data|
      vehicle_data = vehicle_data.slice(:vin_1_10, :model_year, :make, :model)
      vehicle_data[:vin] = vehicle_data.delete(:vin_1_10)
      vehicle_data[:year] = vehicle_data.delete(:model_year)
      vehicle_data[:engine] = :ev
      Vehicle.new(vehicle_data)
    end
  end
end