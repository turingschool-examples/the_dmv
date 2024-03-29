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
        if @services.find('Vehicle Registration')
            collect_fees(vehicle)
            assign_plate(vehicle)
            assign_registration_date(vehicle)
            @registered_vehicles << vehicle
        end
    end

    def administer_written_test(registrant)

    end

    def administer_road_test(registrant)

    end

    def collect_fees(vehicle)
        if vehicle.antique?
            @collected_fees += 25
        elsif vehicle.electric_vehicle?
            @collected_fees += 200
        else
            @collected_fees += 100
        end
    end

    def assign_plate(vehicle)
        if vehicle.antique?
            vehicle.plate_type = :antique
        elsif vehicle.electric_vehicle?
            vehicle.plate_type = :ev
        else
            vehicle.plate_type = :regular
        end
    end

    def assign_registration_date(vehicle)
        vehicle.registration_date = Date.today
    end
end
