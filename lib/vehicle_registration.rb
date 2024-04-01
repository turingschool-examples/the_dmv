class VehicleRegistration
    attr_reader :make, :model, :year, :engine, :registration_date, :plate_type, :vin
    

    def initialize
        @make = make
        @model = model
        @year = year
        @engine = engine
        @registration_date = nil
        @plate_type = nil
        @vin = vin
    end

    
end
