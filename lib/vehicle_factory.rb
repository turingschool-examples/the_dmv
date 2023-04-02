class VehicleFactory

  
  def initialize
  end

  def create_vehicles(location)
    new_car_list = []
    location.each do |vehicle|
      car_hash = {vin: nil, year: nil, make: nil, model: nil, engine: :ev}
      car_hash[:vin] = vehicle[:vin_1_10]
      car_hash[:year] = vehicle[:model_year]
      car_hash[:make] = vehicle[:make]
      car_hash[:model] = vehicle[:model]
      # car_hash[:engine] = vehicle[:engine]
      # require 'pry'; binding.pry
      new_vehicle = Vehicle.new(car_hash)
      new_car_list << new_vehicle
      # vehicle = Vehicle.new(@vehicle_details)
      # if vehicle[:vin, :year, :make, :model, :engine] == 
      # require 'pry'; binding.pry
    end
    new_car_list
  end
end