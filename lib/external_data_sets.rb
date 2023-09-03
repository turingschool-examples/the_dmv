class VehicleFactory
#attr_reader 
def initialize
  @factory_vehicles = []
end

def create_vehicles(api_data)
  api_data.each do |data|
    vehicle = Vehicle.new(data)
    @factory_vehicles << vehicle
    vehicle.vin = [:vin_1_10]
    vehicle.engine = :ev
    vehicle.year = [:model_year]
  end
  @factory_vehicles
end

require 'pry';binding.pry


end

