class VehicleFactory
  attr_reader :vehicles
  
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    car_data = []
    data.each do |car_hash|
      vehicle_details = {}
      vehicle_details[:vin] = car_hash[:vin_1_10]
      vehicle_details[:year] = car_hash[:model_year]
      vehicle_details[:make] = car_hash[:make]
      vehicle_details[:model] = car_hash[:model]
      vehicle_details[:engine] = :ev
      car_data << vehicle_details
    end
    car_data.each do |vehicle_details|
      @vehicles << Vehicle.new(vehicle_details)
    end
    @vehicles
  end

end