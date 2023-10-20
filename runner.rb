require './lib/facility'
require './lib/vehicle'
facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
facility_1.add_service('Vehicle Registration')
cruz.registration_date
facility_1.registered_vehicles
facility_1.collected_fees
facility_1.register_vehicle(cruz)
cruz.registration_date
cruz.plate_type
facility_1.registered_vehicles
facility_1.collected_fees
facility_1.register_vehicle(camaro)
camaro.registration_date
camaro.plate_type
facility_1.register_vehicle(bolt)
bolt.registration_date
bolt.plate_type
facility_1.registered_vehicles
facility_1.collected_fees
facility_2.registered_vehicles
facility_2.services
facility_2.register_vehicle(bolt)
facility_2.registered_vehicles
facility_2.collected_fees
require 'pry'; binding.pry