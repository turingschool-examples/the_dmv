class VehicleFactory
  def initialize
  end
 
  
  def create_vehicle(registration_data)
    car = Vehicle.new(registration_data)
    car.vin = registration_data[:vin_1_10]
    @ew_cars << car
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
