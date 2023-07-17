require_relative 'vehicle_factory'
require_relative 'vehicle'
require_relative 'dmv_data_service'

factory = VehicleFactory.new

wa_ev_registrations = DmvDataService.new.wa_ev_registrations

vehicles_array = factory.create_vehicles(wa_ev_registrations)

def most_popular_make_model(vehicles)
  makes_hash = Hash.new(0)
  vehicles.each do |vehicle|
    makes_hash[vehicle.make] += 1
  end
  makes_hash.max_by {|k,v| v}
end

def vehicles_registered_by_year(vehicles)
  year_hash = Hash.new(0)
  vehicles.each do |vehicle|
    year_hash[vehicle.year] += 1
  end
  year_hash
end

def most_registrations_by_county(vehicles)
  county_hash = Hash.new(0)
  vehicles.each do |vehicle|
    county_hash[vehicle.county] += 1
  end
  county_hash.max_by {|k,v| v}
end

p most_popular_make_model(vehicles_array)
p vehicles_registered_by_year(vehicles_array)
p most_registrations_by_county(vehicles_array)
