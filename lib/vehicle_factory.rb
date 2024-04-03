

class VehicleFactory
    attr_accessor :factory

    def initialize
        @factory = []
    end

    def create_vehicles(data_response)
 
        data_response.each do |vehicle_data| 
            vin = vehicle_data[:vin_1_10]
            make = vehicle_data[:make]
            model = vehicle_data[:model]
            engine = vehicle_data[:electric_vehicle_type]
            year = vehicle_data[:model_year]
            
            vehicle = Vehicle.new({:vin => vin, :year => year, :make => make, :model => model, :engine => engine})
            @factory << vehicle
        end          
        return @factory
    end

end