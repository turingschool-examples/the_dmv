class VehicleFactory

  def initialize
    @create_vehicles = []
  end

  def create_vehicles(registrations)
    @create_vehicles << registrations
  end
end

