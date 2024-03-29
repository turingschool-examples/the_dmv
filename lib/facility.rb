class Facility
    attr_reader :name,
                :address,
                :phone,
                :services,
                :collected_fees,
                :registered_vehicles

    def initialize(facility_hash)
        @name = facility_hash[:name]
        @address = facility_hash[:address]
        @phone = facility_hash[:phone]
        @services = []
        @collected_fees = 0
        @registered_vehicles = []
    end

    def add_service(service)
        @services << service
    end

    def register_vehicle(vehicle)
        # vehicle.registration_date = Date.today
        @registered_vehicles << vehicle if @services.find('Vehicle Registration')
        binding.pry
        @registered_vehicles[0]:registration_date = Date.today
    end
end
