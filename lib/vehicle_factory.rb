class VehicleFactory
              
  def initialize
  end

  def create_vehicles(vehicle_list)
    vehicle_list.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end
end