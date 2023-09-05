class VehicleFactory 
  attr_accessor :registration_date
    attr_reader :engine,
                :make,
                :model,
                :plate_type,
                :vin,
                :year,
                :electric_vehicle_type,
                :vin_1_10,
                :dol_vehicle_id,
                :model_year,
                :vehicles
def initialize 
  @vehicles = []
end 

def create_vehicles(details)
  #vehicles = []
  #binding.pry
 details.map do |vehicle_data|
   Vehicle.new({
     vin: vehicle_data[:vin_1_10],
     year: vehicle_data[:model_year],
     make: vehicle_data[:make],
     model: vehicle_data[:model],
     engine: :ev
   })
   end
 end
end
