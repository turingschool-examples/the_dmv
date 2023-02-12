class VehicleFactory
  attr_reader :vehicles

  def create_vehicles(dmv_hash)
    @vehicles = []
    dmv_hash.each do |vehicle|
      new_vehicle = Vehicle.new(vehicle)
      new_vehicle.engine = :ev
      @vehicles << new_vehicle
      @vehicles
    end
  end
end