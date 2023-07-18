class VehicleFactory
    attr_reader :vehicles
    def initialize
        @vehicles = []
    end

    def create_vehicles(registrations)
        registrations.each do |registration|
            vin = registration[:vin_1_10]
            year = registration[:model_year]
            make = registration[:make]
            model = registration[:model]

            vehicle_details = {
                engine: :ev,
                make: make,
                model: model,
                plate_type: nil,
                registration_date: nil,
                vin: vin,
                year: year, 
            }
        
        vehicle = Vehicle.new(vehicle_details)
        @vehicles << vehicle
    end

    vehicles.inspect
    end

end