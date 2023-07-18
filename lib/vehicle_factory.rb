require './lib/vehicle'
require './lib/dmv_data_service'

class VehicleFactory

    def initialize
    end

    def create_vehicles(register) 
  
        lot = []
        register.each do |data|
           vehicle_details = {:vin => data[:vin_1_10], :year => data[:model_year], :make => data[:make], :model => data[:model], :engine => :ev}
           lot << Vehicle.new(vehicle_details)  
        end
        lot
    end
end