class VehicleFactory
  def initialize
  end

  def create_vehicles(vehicle_details)
    new_vehicles = []
    vehicle_details.each do |car|
      vehicle_details_hash = Hash.new
      vehicle_details_hash[:engine] = :ev
      vehicle_details_hash[:make] = car[:make]
      vehicle_details_hash[:model] = car[:model]
      vehicle_details_hash[:vin] = car[:vin_1_10]
      vehicle_details_hash[:year] = car[:model_year]
      new_vehicles << Vehicle.new(vehicle_details_hash)
    end
    new_vehicles
  end
end