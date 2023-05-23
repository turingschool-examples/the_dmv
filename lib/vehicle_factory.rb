class VehicleFactory
    def initialize
        
    end

    def create_vehicles(registrations)
        registrations.map do |registration|
        Vehicle.new({
            year: registration[:model_year],
            make: registration[:make], 
            model: registration[:model], 
            vin: registration[:vin_1_10], 
            engine: :ev})
        end
    end
end

