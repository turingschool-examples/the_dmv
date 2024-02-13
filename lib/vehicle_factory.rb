class VehicleFactory
  
  def create_vehicles(registrations)
    vehicle = registrations.map do |registration|  
      Vehicle.new(registration)
    end
  end
end