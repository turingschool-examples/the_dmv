require "./lib/facility.rb"
require "./lib/facility_list.rb"
require "./lib/vehicle.rb"
require "./lib/vehicle_factory.rb"
require "./lib/dmv_data_service.rb"

# EV Registrations:

    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)

    # Find the most popular make/model registered

    vehicle_makes = []
    vehicle_models = []
    factory.vehicles.each do |vehicle|
        vehicle_makes << vehicle.make
        vehicle_models << vehicle.model
    end

    puts vehicle_makes.tally.sort_by(&:last).reverse.first
    ## TESLA is the most popular make

    puts vehicle_models.tally.sort_by(&:last).reverse.first
    ## Leaf is the most popular model

    # Count of registered vehicle for a model year

    registered_years = []
    factory.vehicles.each do |vehicle|
        registered_years << vehicle.year
    end

    puts registered_years.tally.sort
    ## Displays number of vehicles for each model year

    # County with most registered vehicles

    registration_counties = []
    wa_ev_registrations.each do |registration|
        registration_counties << registration[:county]
    end

    puts registration_counties.tally.sort_by(&:last).reverse.first
    ## King County has the most vehicle registrations

# Facilities:
    # Add in a few more helpful attributes.
    # What are the daily hours for each facility?

    ## Added functionality to existing classes/tests

    # For the states that provide (Missouri), which holidays are they closed?

    ## Added functionality to existing classes/tests
# Vehicles:
    # Add in a second data source for vehicles and create some Vehicle objects from NY State Registration Data: https://data.ny.gov/resource/w4pv-hbkt.json