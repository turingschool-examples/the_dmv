class VehicleFactory
#attr_reader 
def initialize
  @factory_vehicles = []
end

def create_vehicles(api_data)
  api_data.each do |vehicle_data|
    car_data = {
    vin: vehicle_data[:vin_1_10],
    make: vehicle_data[:make],
    model: vehicle_data[:model],
    year: vehicle_data[:model_year],
    engine: :ev,  
    }
    vehicle = Vehicle.new(car_data)
    @factory_vehicles << vehicle
  end
  @factory_vehicles
end

#require 'pry';binding.pry

end

