class VehicleFactory

  def create_vehicles(vehicle_array)
    updated_keys = vehicle_key_updater(vehicle_array)
    updated_keys.map do |attr|
      Vehicle.new(attr)
    end
  end

  def vehicle_key_updater(unformatted_vehicles)
    flattened_array = [unformatted_vehicles].flatten
    temp = flattened_array.each do |vehicle|
      vehicle[:vin] = vehicle[:vin_1_10]
      vehicle[:year] = vehicle[:model_year].to_i
      vehicle[:engine] = :ev
    end
    temp
  end
end