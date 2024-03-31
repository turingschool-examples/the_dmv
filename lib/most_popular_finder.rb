class MostPopularFinder
    attr_reader :factory

    def initialize
        @factory = VehicleFactory.new
    end

    def most_popular_make_registered(vehicle_registrations)
        vehicle_make_counter = Hash.new(0)
        @factory.create_vehicles(vehicle_registrations).each do |vehicle|
            vehicle_make_counter[vehicle.make] += 1
        end
        vehicle_make_counter.first[0]
    end
end