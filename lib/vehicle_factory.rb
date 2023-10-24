class VehicleFactory
attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(api)
  # Helper method here
    sort_out_boats_and_trl(api)
    api.each do |vehicle|
      if vehicle[:vin].nil?
        vehicle[:vin] = vehicle.delete :vin_1_10
      end
      if vehicle[:model] == nil
        vehicle[:model] = "Model not listed"
      end
      if vehicle[:fuel_type].nil? 
        vehicle[:engine] = :ev
      else
        vehicle[:engine] = vehicle[:fuel_type]
      end
      vehicle[:year] = vehicle.delete :model_year
      vehicle = Vehicle.new(vehicle)
      @vehicles << vehicle
    end
  end

  def most_popular_ev
    ev_counter = Hash.new(0)
    make_and_models.values.flatten.each do |value|
    # value, or the model, becomes a key for the ev_counter
      ev_counter[value] += 1
    end
    make = nil
    # The model variable finds the most popular model
    model = ev_counter.key(ev_counter.values.sort[-1])
    # Now iterate through the make_and_models to find the make of the model
    make_and_models.each do |key, value|
      if value.include?(model)
        make = key
      end
    end
    "The most popular make and model is the #{make} #{model}!"
  end

  def registered_evs_for_model_year(year)
    @count = 0
    @vehicles.each do |vehicle|
      if vehicle.year == year
        @count += 1
      end
    end
    check_for_year(year)
  end

  def county_with_most_registered_vehicles
    county_hash = Hash.new(0)
    @vehicles.each do |vehicle|
      county_hash[vehicle.county] += 1
    end
    # Instead of excess code, I can sort the values from lowest to highest, and then use that to find the key, or county
    county_hash.key(county_hash.values.sort[-1])
    ##################OLD CODE################
    # county = 0
    # county_with_most_registered_vehicles = nil
    # county_hash.each do |key, value|
    #   while value > county
    #     county = value
    #   end
    #   if value == county then
    #     county_with_most_registered_vehicles = key
    #   end
    # end
    # county_with_most_registered_vehicles
  end

# Method to make a hash of [make, models]
  def make_and_models
    make_and_model = Hash.new{|hsh,key| hsh[key] = []}
    @vehicles.each do |vehicle|
      make_and_model[vehicle.make].push(vehicle.model)
    end
    make_and_model
  end

# Filter out the boats and other vehicles
  def sort_out_boats_and_trl(api)
    api.select! do |vehicle|
      if vehicle.values.include?("BOAT") == false && vehicle.values.include?("TRL") == false
        vehicle
      end
    end
  end
# Check to make sure the year that's being checked is a valid year
  def check_for_year(year)
    if year.is_a? Integer
      "Error, try a string"
    elsif year.length != 4
      "Year must be 4 characters long"
    elsif year.to_i < 2008 || year.to_i > 2023
      "Year is too early for EVs or in the future"
    else
      @count
    end
  end
end