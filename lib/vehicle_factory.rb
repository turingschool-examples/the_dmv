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
                vin: vin,
                year: year,
                make: make,
                model: model,
                engine: :ev,
                registration_date: nil,
                plate_type: nil
            }
        
        vehicle = Vehicle.new(vehicle_details)
        @vehicles << vehicle
    end

    vehicles 
    end

end