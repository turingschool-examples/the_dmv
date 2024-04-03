class VehicleFactory
    attr_reader

    def initialize(vehicle_details)
        @vin = vehicle_details[:vin]
        @year = vehicle_details[:year]
        @make = vehicle_details[:make]
        @model = vehicle_details[:model]
        @engine = vehicle_details[:ev]
        @registration_date = nil
    end

    

end