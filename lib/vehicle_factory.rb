class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(data_service)
    data_service.each do |vehicle_info|
      vehicle_info[:engine] = change_to_engine_key(vehicle_info)
      vehicle_info[:year] = vehicle_info[:model_year]
      vehicle_info[:vin] = change_to_vin_key(vehicle_info)
      vehicle_info[:model] = change_to_model_key(vehicle_info)
      @vehicles << Vehicle.new(vehicle_info)
    end
    @vehicles
  end

  def change_to_engine_key(vehicle_info)
    if vehicle_info.has_key?(:electric_vehicle_type)
      :ev
    elsif vehicle_info[:fuel_type] == "GAS"
      :gas
    else
      'Unavailable.'
    end
  end

  def change_to_vin_key(vehicle_info)
    if vehicle_info.has_key?(:vin)
      vehicle_info[:vin]
    elsif vehicle_info.has_key?(:vin_1_10)
      vehicle_info[:vin_1_10]
    else
      'Unavailable.'
    end
  end

  def change_to_model_key(vehicle_info)
    if vehicle_info.has_key?(:model)
      vehicle_info[:model]
    else
      'Unavailable.'
    end
  end

  def count_vehicle_makes
    makes = Hash.new(0)
    @vehicles.each do |vehicle|
      makes[vehicle.make] += 1
    end
    makes
  end

  def count_vehicle_models
    models = Hash.new(0)
    @vehicles.each do |vehicle|
      models[vehicle.model] += 1
    end
    models
  end

  def most_popular_make
    most_popular_make = nil
    highest_count = 0
    count_vehicle_makes.each do |key, value|
      if value > highest_count
        most_popular_make = key
        highest_count = value
      end
    end
    "The most popular make is #{most_popular_make} with a count of #{highest_count}."
  end

  def count_model_by_year(model, year)
    number = 0
    @vehicles.each do |vehicle|
      number += 1 if vehicle.year == year.to_s && vehicle.model.downcase == model.downcase
    end
    number
  end

  def count_vehicle_counties
    counties = Hash.new(0)
    @vehicles.each do |vehicle|
      counties[vehicle.county] += 1
    end
    counties
  end

  def most_popular_county
    most_popular_county = nil
    highest_count = 0
    count_vehicle_counties.each do |key, value|
      if value > highest_count
        most_popular_county = key
        highest_count = value
      end
    end
    "The most popular county is #{most_popular_county} with a count of #{highest_count} vehicles."
  end
end