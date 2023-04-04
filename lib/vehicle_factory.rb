class VehicleFactory
  attr_accessor :vehicles

  def initialize
    @vehicles = []

  end

  def create_vehicles(wa_ev_registrations)
    @vehicles << wa_ev_registrations
    @vehicles.flatten!
  end

end