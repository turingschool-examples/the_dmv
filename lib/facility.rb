class Facility

    attr_reader :name,
                :address, 
                :phone, 
                :services,
                :registered_vehicles,
                :collected_fees

    def initialize(facility_info)
        @name = facility_info[:name] 
        @address = facility_info[:address]
        @phone = facility_info[:phone]
        @services = []
        @registered_vehicles = []
        @collected_fees = 0
    end

    # Methods

    def add_service(service)
        @services << service
    end

    # A facility must include the service in order to perform it

    # Register a Vehicle
    def register_vehicle(vehicle)
        if @services.include? ("Vehicle Registration")
            vehicle.change_registration_date
            vehicle.update_plate_type
            @collected_fees += vehicle.fees
            @registered_vehicles << vehicle
        end
    end

    # Administer a Written Test
        # A written test can only be administered to registrants with a permit and are at least 16 years of age

    # Administer a Road Test
        # A road test can only be administered to registrants who have passed the written test
        # Registrants who qualify for the road test automatically earn a license

    # Renew a Driver's License
        # A license can only be renewed if the registrant has already passed the road test

end
