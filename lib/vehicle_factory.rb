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
    if api_hash[:state_of_residence] == "WA"
      wa_parse(api_hash)
    else
      ny_parse(api_hash)
    end
  end

  def wa_parse(api_hash)
    api_hash[:year] = api_hash[:model_year]
    api_hash[:engine] = :ev
    api_hash[:vin] = api_hash[:vin_1_10]
    api_hash
  end

  def ny_parse(api_hash)
    api_hash[:year] = api_hash[:model_year]
    if api_hash[:fuel_type] != nil
      api_hash[:engine] = api_hash[:fuel_type]
    else
      api_hash[:engine] = "NONE"
    end
    api_hash[:vin] = api_hash[:vin]
    api_hash[:model] = api_hash[:body_type]
    api_hash
  end



end