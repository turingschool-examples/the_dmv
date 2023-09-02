class Factory

  def create_vehicles(api_hash_array)
    new_vehicles = []
    api_hash_array.each do |vehicle_data|
      vehicle = Vehicle.new(parse(vehicle_data))
      new_vehicles << vehicle
    end
    new_vehicles
  end

  def parse(api_hash)
    api_hash[:year] = api_hash[:model_year]
    api_hash[:engine] = :ev
    api_hash[:vin] = api_hash[:vin_1_10]
    api_hash
  end


end