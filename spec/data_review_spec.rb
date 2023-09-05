

@creator = FacilityCreator.new
@factory = VehicleFactory.new
@co_dmv_registrations = [] 
@co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[0]
@facility_1 = @creator.create_facility(@co_dmv_registrations)
@wa_ev_registrations = [] 
@wa_ev_registrations << DmvDataService.new.wa_ev_registrations[0]
@wa_ev_registrations << DmvDataService.new.wa_ev_registrations[1]
@wa_ev_registrations << DmvDataService.new.wa_ev_registrations[2]
@vehicles = @factory.create_vehicles(@wa_ev_registrations)
@facility_1.first.add_service("Vehicle Registration")
@facility_1.first.register_vehicle(@vehicles[0])
@facility_1.first.register_vehicle(@vehicles[1])
@facility_1.first.register_vehicle(@vehicles[2])

@research = DataReview.new(@facility_1[0])
@research.find_popular_by_make
@research.find_popular_by_model
@research.registered_vehicle_count_by_model_year(2015)
