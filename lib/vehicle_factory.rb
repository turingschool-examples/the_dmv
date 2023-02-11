class VehicleFactory
  def initialize
    @create_vehicles = []
  end

  def create_vehicles(ev_registration)
    @create_vehicles << ev_registration
  end
end