require './lib/dmv.rb'
require './lib/dmv_data_service.rb'
require './lib/facility.rb'
require './lib/facility_factory.rb'
require './lib/registrant.rb'
require './lib/vehicle.rb'
require './lib/vehicle_factory.rb'

# Testing Iteration 3

# factory = FacilityFactory.new

# colorado = DmvDataService.new.co_dmv_office_locations
# p factory.create_facilities(colorado)

# new_york = DmvDataService.new.ny_dmv_office_locations
# p factory.create_facilities(new_york)

# missouri = DmvDataService.new.mo_dmv_office_locations
# p factory.create_facilities(missouri)

# Testing Iteration 2

# p factory = VehicleFactory.new
# p wa_ev_registrations = DmvDataService.new.wa_ev_registrations
# p factory.create_vehicles(wa_ev_registrations)

# p registrant_1 = Registrant.new('Bruce', 18, true )
# p registrant_2 = Registrant.new('Penny', 16 )
# p registrant_3 = Registrant.new('Tucker', 15 )
# p facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
# p facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
# p registrant_1.license_data
# p registrant_1.permit?
# p facility_1.administer_written_test(registrant_1)
# p registrant_1.license_data
# p facility_1.add_service('Written Test')
# p facility_1.administer_written_test(registrant_1)
# p registrant_1.license_data
# p registrant_2.age
# p registrant_2.permit?
# p facility_1.administer_written_test(registrant_2)
# p registrant_2.earn_permit
# p facility_1.administer_written_test(registrant_2)
# p registrant_2.license_data
# p registrant_3.age
# p registrant_3.permit?
# p facility_1.administer_written_test(registrant_3)
# p registrant_3.earn_permit
# p facility_1.administer_written_test(registrant_3)
# p registrant_3.license_data
# puts ' '
# p facility_1.administer_road_test(registrant_3)
# p registrant_3.earn_permit
# p facility_1.administer_road_test(registrant_3)
# p registrant_3.license_data
# p facility_1.administer_road_test(registrant_1)
# p facility_1.add_service('Road Test')
# p facility_1.administer_road_test(registrant_1)
# p registrant_1.license_data
# p facility_1.administer_road_test(registrant_2)
# p registrant_2.license_data
# puts ' '
# p facility_1.renew_drivers_license(registrant_1)
# p facility_1.add_service('Renew License')
# p facility_1.renew_drivers_license(registrant_1)
# p registrant_1.license_data
# p facility_1.renew_drivers_license(registrant_3)
# p registrant_3.license_data
# p facility_1.renew_drivers_license(registrant_2)
# p registrant_2.license_data

# p facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
# p facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
# p cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
# p bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
# p camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

# p facility_1.add_service('Vehicle Registration')
# p cruz.registration_date
# p facility_1.registered_vehicles
# p facility_1.collected_fees
# p facility_1.register_vehicle(cruz)
# p cruz.registration_date
# p cruz.plate_type
# p facility_1.registered_vehicles
# p facility_1.collected_fees
# p facility_1.register_vehicle(camaro)
# p camaro.registration_date
# p camaro.plate_type
# p facility_1.register_vehicle(bolt)
# p bolt.registration_date
# p bolt.plate_type
# p facility_1.registered_vehicles
# p facility_1.collected_fees
# p facility_2.registered_vehicles
# p facility_2.services
# p facility_2.register_vehicle(bolt)
# p facility_2.registered_vehicles
# p facility_2.collected_fees

# Testing Iteration 1

# p registrant_1 = Registrant.new('Bruce', 18, true)
# p registrant_2 = Registrant.new('Penny', 15)

# p registrant_1.name
# p registrant_1.age
# p registrant_1.permit?
# p registrant_1.license_data
# p registrant_2.name
# p registrant_2.age
# p registrant_2.permit?
# p registrant_2.license_data
# p registrant_2.earn_permit
# p registrant_2.permit?