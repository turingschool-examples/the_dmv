class VehicleFactory

  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      name = vehicle[:model].downcase
      name = Vehicle.new(vehicle)
    end
  end

end