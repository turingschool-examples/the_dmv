

class VehicleFactory 
  def create_vehicles(car_registrations)
    vehicle_key_editor(car_registrations)
    car_registrations.map do |car|
      Vehicle.new(car)
    end
  end
  def vehicle_key_editor(car_registrations)
    car_registrations.each do |parts|
      parts[:vin] = parts[:vin_1_10]
      parts[:model] = parts[:model]
      parts[:year] = parts[:model_year]
      parts[:make] = parts[:make]
      parts[:model] = parts[:model]
      parts[:engine] = :ev
    end
  end
end