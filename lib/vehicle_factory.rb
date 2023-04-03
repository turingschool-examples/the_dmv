class VehicleFactory
              
  def initialize
  end

  def create_vehicles(vehicle_list)
    vehicle_list.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end

  def rename_vehicles(vehicle_list)
    vehicle_list.find_all do |vehicle_data|
      vehicle_data[:vin] = vehicle_data.delete :dol_vehicle_id
      vehicle_data[:year] = vehicle_data.delete :model_year
      vehicle_data[:engine] = :ev
    end
  end
end