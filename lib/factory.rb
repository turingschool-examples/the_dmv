class Factory

  def create_vehicles(wa_ev_registrations)
    new_vehicles = []
    wa_ev_registrations.each do |vehicle_data|
      vehicle = Vehicle.new(vehicle_data)
      new_vehicles << vehicle
    end
    new_vehicles
  end

end