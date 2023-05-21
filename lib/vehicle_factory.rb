
class VehicleFactory
  def create_vehicles(car_registrations)
    car_registrations.map do |car|
      Vehicle.new(car)
    end
  end
end