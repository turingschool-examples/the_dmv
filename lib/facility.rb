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

    # Add Service
    def add_service(service)
        @services << service
    end

    # Register a Vehicle
    def register_vehicle(vehicle)
        if @services.include? ("Vehicle Registration")
            vehicle.change_registration_date
            vehicle.update_plate_type
            @collected_fees += vehicle.fees
            @registered_vehicles << vehicle
        else
            return false
        end
    end

    # Administer a Written Test
    def administer_written_test(registrant)
        if @services.include? ("Written Test")
            registrant.are_written_eligible?
        else
            return false
        end
    end

    # Administer a Road Test
    def administer_road_test(registrant)
        if @services.include? ("Road Test")
            registrant.are_road_eligible?
        else
            return false
        end
    end

    # Renew a Driver's License
    def renew_drivers_license(registrant)
        if @services.include? ("Renew License")
            registrant.are_renew_eligible?
        else
            return false
        end
    end

end
