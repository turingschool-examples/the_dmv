class Analytics 

    attr_reader :ev_vehicles,
                :facility

    def initialize(facility)
        @ev_vehicles = []
        @facility = facility
    end

    def ev_vehicles_registered
        @ev_vehicles = @facility.registered_vehicles.find_all do |vehicle|
        vehicle.engine == :ev
        end
        @ev_vehicles
    end

    def reg_ev_vehicles_makes
        @reg_ev_vehicles_makes = []
        ev_vehicles_registered.map do |vehicle|
            @reg_ev_vehicles_makes << vehicle.make
        end
        @reg_ev_vehicles_makes
    end

    def most_popular_make
        @most_popular_make = @reg_ev_vehicles_makes.max_by do |make|
        @reg_ev_vehicles_makes.count(make)
        end
    end

    def ev_registration_analytics 
        ev_vehicles_registered
        reg_ev_vehicles_makes
        "The most popular vehicle make registered in #{@facility.name} facility was #{most_popular_make}"
    end

end