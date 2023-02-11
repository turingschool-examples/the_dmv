class VehicleFactory
  def initialize
  end

  def create_vehicles(data)
    vehicle_data_hashes = []
    data.each do |vehicle|
      vehicle_hash = {}
      vehicle_hash[:vin] = vehicle[:vin_1_10]
      vehicle_hash[:year] = vehicle[:model_year]
      vehicle_hash[:make] = vehicle[:make]
      vehicle_hash[:model] = vehicle[:model]
      vehicle_hash[:engine] = :ev
      vehicle_data_hashes << vehicle_hash
    end

    vehicles = []
    vehicle_data_hashes.each do |hash|
      vehicles << Vehicle.new(hash)
    end
    vehicles
  end
end
