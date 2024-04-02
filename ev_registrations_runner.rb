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

# Count of registered vehicle for a model year

def count_vehicles_by_year(vehicles, year)
    year_array = []
    vehicles.each do |vehicle|
        if vehicle.year == year
            year_array << vehicle
        end
    end
    puts "There are #{year_array.count} vehicles registered with the model year #{year}."
end

count_vehicles_by_year(wa_ev_vehicles, "2023")

# County with most registered vehicles

def county_with_most_vehicles(vehicles)
    county_array = []
    vehicles.each do |vehicle|
        county = vehicle.county
        county_array << county
    end
    tallied = county_array.tally
    sorted = tallied.sort_by {|_key, value| value}
    puts "The county with the most registered vehicles is #{sorted.last[0]} county with #{sorted.last[1]} vehicles registered."
end

county_with_most_vehicles(wa_ev_vehicles)