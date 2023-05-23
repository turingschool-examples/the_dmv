class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicle_order(order)
    if order.is_a?(Array)
      order.each do |item|
        formatted_data = data_formatter(item)
        new_car = Vehicle.new(formatted_data)
        new_car.engine = :ev 
        @created_vehicles << new_car
      end
    else
      formatted_data = data_formatter(order)
      new_car = Vehicle.new(formatted_data)
      new_car.engine = :ev 
      @created_vehicles << new_car
    end
    @created_vehicles
  end

  def all_cars
    cars = []
    vin_list = []
  
    @created_vehicles.each do |vehicle|
      if vin_list.include?(vehicle.vin)
        next
      else
        vin_list << vehicle.vin
        cars << vehicle
      end
    end
    cars
  end
  

  def data_formatter(vehicle)
    formatted_vehicle = {}
    vehicle.each do |key, value|
      if key.to_s.downcase.include?("vin")
        formatted_vehicle[:vin] = value
      elsif key.to_s.downcase.include?("year")
        formatted_vehicle[:year] = value
      else
        formatted_vehicle[key] = value
      end
    end
    formatted_vehicle
  end
end
