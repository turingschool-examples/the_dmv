

class VehicleFactory
  attr_reader :registered_vehicles, :dmv
  def initialize
    @dmv = Vehicle_detail_handler.new
  end
 
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
    end
  end
end