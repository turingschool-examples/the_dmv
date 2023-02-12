class VehicleFactory
  def initialize
  end
  
  def create_vehicles(registration_data)
    new_cars = []
    registration_data.map do |hash|
      hash[:vin] = hash[:vin_1_10]
      hash[:year] = hash[:model_year]
      hash[:engine] = :ev
     new_cars << Vehicle.new(hash)
    end
    new_cars
  end
end
