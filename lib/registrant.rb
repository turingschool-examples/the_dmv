require './lib/registrant'

registrant_1 = Registrant.new('Bruce', 18, true )
registrant_2 = Registrant.new('Penny', 15 )

@age = 18, 
@license_data = {:written=>false, :license=>false, :renewed=>false}, 
@name = "Bruce", 
@permit = true,
@age = 15, 
@license_data = {:written=>false, :license=>false, :renewed=>false}, 
@name = "Penny", 
@permit = false

registrant_1.name = "Bruce"
registrant_1.age = 18
registrant_1.permit? = true
registrant_1.license_data = {:written=>false, :license=>false, :renewed=>false}

registrant_2.name = "Penny"
registrant_2.age = 15
registrant_2.permit? = false
registrant_2.license_data = {:written=>false, :license=>false, :renewed=>false}
registrant_2.earn_permit = false
registrant_2.permit? = true