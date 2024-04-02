class VehicleFactory
  def initialize
  end

  def create_vehicles(registrations)
    registrations.map do |vehicle_data|
      vehicle_data[:year] = vehicle_data.delete :model_year
      vehicle_data[:vin] = vehicle_data.delete :vin_1_10
      vehicle_data[:engine] = :ev
      Vehicle.new(vehicle_data)
    end
  end
end