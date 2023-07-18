class ExistingFacility  
    attr_reader :vehicles
    def initialize
        @facility_info = []
    end

    def read_information(data)
        data.each do |detail|
            name = detail[:dmv_office]
            address = "#{detail[:model_year]
            phone = detail[:make]
            services = detail[:model]

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