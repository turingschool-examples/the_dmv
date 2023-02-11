class VehicleFactory
  attr_reader :state_vehicles


  def create_vehicles(state_data)
    @state_vehicles = []
    for i in 0..state_data.count - 1
      current_hash = state_data[i]
      vehicle_hash = {vin: current_hash[:vin_1_10], 
                      year: current_hash[:model_year].to_i, 
                      make: current_hash[:make], 
                      model: current_hash[:model], 
                      engine: current_hash[:electric_vehicle_type]}
      @state_vehicles << Vehicle.new(vehicle_hash)
    end
  end

end