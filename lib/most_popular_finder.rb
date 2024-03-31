class MostPopularFinder
    attr_reader :factory

    def initialize
        @factory = VehicleFactory.new
    end

    def most_popular_vehicle_registered(vehicle_registrations)
        vehicles = @factory.create_vehicles(vehicle_registrations)

        make_model = vehicles.map {|vehicle| "#{vehicle.make} #{vehicle.model}"}

        make_model.group_by {|string| string}.max_by {|k,v| v.size}.first
    end

    def most_popular_model_year_registered(vehicle_registrations)
        model_year_count = Hash.new(0)
        @factory.create_vehicles(vehicle_registrations).each do |vehicle|
            model_year_count[vehicle.year] += 1
        end
        "#{model_year_count.first[0]} with #{model_year_count.first[1]} registrations"
    end
end