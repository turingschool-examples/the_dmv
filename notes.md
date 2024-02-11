#Written Test

pry(main)> registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> registrant_1.permit?
#=> true

pry(main)> facility_1.administer_written_test(registrant_1)
#=> false

pry(main)> registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> facility_1.add_service('Written Test')
#=> ["Written Test"]

pry(main)> facility_1.administer_written_test(registrant_1)
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>true, :license=>false, :renewed=>false}

pry(main)> registrant_2.age
#=> 16

pry(main)> registrant_2.permit?
#=> false

pry(main)> facility_1.administer_written_test(registrant_2)
#=> false

pry(main)> registrant_2.earn_permit

pry(main)> facility_1.administer_written_test(registrant_2)
#=> true

pry(main)> registrant_2.license_data
#=> {:written=>true, :license=>false, :renewed=>false}

pry(main)> registrant_3.age
#=> 15

pry(main)> registrant_3.permit?
#=> false

pry(main)> facility_1.administer_written_test(registrant_3)
#=> false

pry(main)> registrant_3.earn_permit

pry(main)> facility_1.administer_written_test(registrant_3)
#=> false

pry(main)> registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

# Road Test

pry(main)> facility_1.administer_road_test(registrant_3)
#=> false

pry(main)> registrant_3.earn_permit

pry(main)> facility_1.administer_road_test(registrant_3)
#=> false

pry(main)> registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> facility_1.administer_road_test(registrant_1)
#=> false

pry(main)> facility_1.add_service('Road Test')
#=> ["Written Test", "Road Test"]

pry(main)> facility_1.administer_road_test(registrant_1)
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>true, :license=>true, :renewed=>false}

pry(main)> facility_1.administer_road_test(registrant_2)
#=> true

pry(main)> registrant_2.license_data
#=> {:written=>true, :license=>true, :renewed=>false}

# Renew License

pry(main)> facility_1.renew_drivers_license(registrant_1)
#=> false

pry(main)> facility_1.add_service('Renew License')
#=> ["Written Test", "Road Test", "Renew License"]

pry(main)> facility_1.renew_drivers_license(registrant_1)
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>true, :license=>true, :renewed=>true}

pry(main)> facility_1.renew_drivers_license(registrant_3)
#=> false

pry(main)> registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> facility_1.renew_drivers_license(registrant_2)
#=> true

pry(main)> registrant_2.license_data
#=> {:written=>true, :license=>true, :renewed=>true}
