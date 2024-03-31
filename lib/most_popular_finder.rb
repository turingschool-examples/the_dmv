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
end