require './lib/vehicle'
require './lib/dmv_data_service'

class VehicleFactory

  def create_vehicles(database) 
    vehicles = [] 
  
    database.each do |data| 
      new_vehicle = Vehicle.new({ 
        engine: :ev,
        make: data[:make],
        model: data[:model],
        vin: data[:vin_1_10],
        year: data[:model_year].to_i
      })
      vehicles << new_vehicle
    end
    vehicles
  end
end