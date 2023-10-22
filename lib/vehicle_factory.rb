
class VehicleFactory
  attr_accessor :most_popular_make_model

  def initialize
    @most_popular_make_model = ""
  end

  def create_vehicles(input_api)
    created_vehicles = []
    input_api.each do |hash|
      hash_final = {}
      hash_final[:vin] = hash[:vin_1_10]
      hash_final[:year] = hash[:model_year]
      hash_final[:make] = hash[:make]
      hash_final[:model] = hash[:model]
      hash_final[:engine] = :ev
      # require 'pry'; binding.pry
      created_vehicles << Vehicle.new(hash_final)
    end

    all_makes_models = []

    created_vehicles.each do |vehicle|
      make_model = []
      make_model << "#{vehicle.make}, #{vehicle.model}"
      all_makes_models << make_model
    end
      
    models_count = Hash.new(0)

    all_makes_models.each do |model| 
        models_count[model] += 1
    end

    @most_popular_make_model = (models_count.sort_by { |model,number| number}.last[0]).join
    created_vehicles
  end

end