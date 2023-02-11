class VehicleFactory
  attr_reader :state_vehicles


  def create_vehicles(state_data)
    state_vehicles = []
    for i in 0..state_data.count - 1
      current_hash = state_data[i]
      vehicle_hash = {vin: current_hash[:vin_1_10]}
      @state_vehicles << Vehicle.new(vehicle_hash)
    end
  end

end