class Analyzer

    def initialize
        @vehicle_models = []
        @most_popular_vehicle = [] 
    end

    def vehicle_models(vehicles)        
        vehicles.each do |vehicle|
            @vehicle_models << vehicle.model
        end
        @vehicle_models
    end

    def model_counter(vehicles)
        vehicle_models(vehicles)
        @vehicle_models.tally
    end

    def most_popular_model(vehicles)
        most_popular_model = model_counter(vehicles).max_by do |model, count|
            count
        end
        most_popular_model
    end

    def most_popular_vehicle(vehicles)
        vehicle_object = vehicles.find do |vehicle|
            vehicle.model == most_popular_model(vehicles).first
        end
        @most_popular_vehicle << vehicle_object.make
        @most_popular_vehicle << most_popular_model(vehicles).first
        @most_popular_vehicle
    end

    def count_by_model_year(year, vehicles)
        vehicles.count do |vehicle|
            vehicle.year.to_s == year.to_s
        end
    end

    def county_with_most_registrations(vehicles)
        counties = []
        vehicles.each do |vehicle|
            counties << vehicle.county
        end
        counties = counties.tally.max_by do |county, count|
            count
        end
        counties.first
    end
end
