class VehicleFactory
  attr_reader :created_vehicles
  def initialize
    @all_created_vehicles = []
  end
  
  def create_vehicles(vehicles)
    until vehicles.empty?
      vehicles.map do |vehicle|
        new_vehicle = Vehicle.new(vehicle)
        new_vehicle.vin = vehicle[:vin_1_10]
        new_vehicle.engine = :ev
        new_vehicle.year = vehicle[:model_year].to_i
        @all_created_vehicles << new_vehicle
      end
   end
   @all_created_vehicles
  end
end