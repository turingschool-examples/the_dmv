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
end



  # I really wanted to make a hash where all the makes are keys with a value of all the models which in turn were hashes with values of each year which were hashes with a value of the count.
  # def group_by_make
  #   @vehicles.group_by do |vehicle|
  #     vehicle.make
  #   end
  # end

  # def group_by_make_model
  #   by_make_model = {}
  #   by_make_model = group_by_make.each do |make, vehicle|
  #     vehicle.model
  #   end
  # end