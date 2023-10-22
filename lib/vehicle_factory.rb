class VehicleFactory
attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(api)
    api.each do |vehicle|
      vehicle[:vin] = vehicle.delete :vin_1_10
      vehicle[:year] = vehicle.delete :model_year
      vehicle = Vehicle.new(vehicle)
      vehicle.engine = :ev
      @vehicles << vehicle
    end
  end

  def most_popular_ev
    tesla_counter = Hash.new(0)
    make_and_models.values.flatten.each do |value|
      tesla_counter[value] += 1
    end
    model = tesla_counter.key(tesla_counter.values.sort[-1])
    make = nil
    make_and_models.each do |key, value|
      if value.include?(model)
        make = key
      end
    end
    "The most popular make and model is the #{make} #{model}!"
  end

  def make_and_models
    make_and_model = Hash.new{|hsh,key| hsh[key] = []}
    @vehicles.select! do |vehicle|
      make_and_model[vehicle.make].push(vehicle.model)
    end
    make_and_model
  end

  def registered_vehicles_for_model_year(year)
    count = 0
    @vehicles.each do |vehicle|
      if vehicle.year == year
        count += 1
      end
    end

    if year.is_a? Integer
      "Error, try a string"
    elsif year.length != 4
      "Year must be 4 characters long"
    elsif year.to_i < 2008 || year.to_i > 2023
      "Year is too early for EVs or in the future"
    else
      count
    end
  end

end