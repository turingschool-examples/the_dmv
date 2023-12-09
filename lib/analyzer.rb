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
end
