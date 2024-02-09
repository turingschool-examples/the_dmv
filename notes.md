pry(main)> require './lib/registrant'
#=> true

pry(main)> registrant_1 = Registrant.new('Bruce', 18, true )
#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

pry(main)> registrant_2 = Registrant.new('Penny', 15 )
#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

pry(main)> registrant_1.name
#=> "Bruce"

pry(main)> registrant_1.age
#=> 18

pry(main)> registrant_1.permit?
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> registrant_2.name
#=> "Penny"

pry(main)> registrant_2.age
#=> 15

pry(main)> registrant_2.permit?
#=> false

pry(main)> registrant_2.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> registrant_2.earn_permit

pry(main)> registrant_2.permit?
#=> true
