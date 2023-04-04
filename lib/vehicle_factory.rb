class VehicleFactory
              
  def initialize
  end

  def create_vehicles(vehicle_list)
    vehicle_list.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end

  def rename_vehicles(vehicle_list)
    vehicle_list.each do |vehicle_data|
      vehicle_data[:vin] = vehicle_data[:dol_vehicle_id]
      vehicle_data[:year] = vehicle_data[:model_year]
      vehicle_data[:engine] = :ev
    end
  end
end

# Iteration 4 (failed) attempt:
  # def common_models(list)
  #   models = list.map do |vehicle|
  #     vehicle.model
  #   end
  #   models.tally
  # end