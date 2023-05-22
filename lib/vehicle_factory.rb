class VehicleFactory

  def create_vehicles(registrations)
      vehicles = format(registrations)
      vehicles.map do |vehicle|
          Vehicle.new(vehicle)
      end
  end
end