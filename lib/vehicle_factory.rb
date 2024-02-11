class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(data_service)
    data_service.each do |vehicle_info|
      vehicle_info[:engine] = :ev if vehicle_info[:engine] == nil
      vehicle_info[:year] = vehicle_info[:model_year]
      vehicle_info[:vin] = vehicle_info[:vin_1_10]
      @vehicles << Vehicle.new(vehicle_info)
    end
    @vehicles
  end

  def count_vehicle_makes
    makes = Hash.new(0)
    @vehicles.each do |car|
      makes[car.make.to_sym] += 1
    end
    makes
  end

  def count_vehicle_models
    models = Hash.new(0)
    @vehicles.each do |car|
      models[car.model.to_sym] += 1
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
end