require './lib/vehicle'
require './lib/dmv_data_service'

class VehicleFactory

    def initialize
    end

    def create_vehicles(register)
        register.each do
            vehical_values = (register.map { |vehical| vehical.values})
                Vehicle.new
        
        
        end
    end
end