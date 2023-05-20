class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicles(vehicles)
    if vehicles.is_a?(Array)
      vehicles.each do |vehicle|
        new_car = Vehicle.new(vehicle)
        new_car.engine = :ev 
        @created_vehicles << new_car
      end
    else
      new_car = Vehicle.new(vehicles)
      @created_vehicles << new_car
    end
  end

end 
