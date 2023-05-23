require './lib/facility'
require './lib/dmv_data_service'

class VehicleFactory 
  attr_reader :new_vehicles
  
  def initialize 
    @new_vehicles = []
  end

  def create_vehicles(external_data) 
    external_data.each do |data|
     new_vehicles = {}
     new_vehicles[:vin] = data[:vin_1_10]
     new_vehicles[:year] = data[:model_year]
     new_vehicles[:make] = data[:make]
     new_vehicles[:model] = data[:model]
     new_vehicles[:engine] = :ev
     new_vehicles[:plate_type] = :ev
     @new_vehicles << Vehicle.new(new_vehicles)
    end
   @new_vehicles
    end
end