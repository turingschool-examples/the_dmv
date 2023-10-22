
class VehicleFactory

  def initialize
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
    created_vehicles
  end
end