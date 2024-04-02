require './spec/spec_helper'

wa_ev_registrations = DmvDataService.new.wa_ev_registrations

vehicle_factory = VehicleFactory.new

wa_ev_vehicles = vehicle_factory.create_vehicles(wa_ev_registrations)

# Find the most popular make/model registered

def find_most_popular_vehicle(vehicles)
    make_model_array = []
    vehicles.each do |vehicle|
        vehicle = "#{vehicle.make} #{vehicle.model}"
        make_model_array << vehicle
    end
    tallied = make_model_array.tally
    sorted = tallied.sort_by {|_key, value| value}
    puts "The most popular vehicle is a #{sorted.last[0]} - #{sorted.last[1]} are registered."
end

find_most_popular_vehicle(wa_ev_vehicles)


