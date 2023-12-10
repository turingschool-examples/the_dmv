require './lib/registrant'

RSpec.describe Registrant do 
  before[:each] do 
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end

  describe '#initialize' do
    it 'can initialize' do 
      expect(registrant).to be_an_instance_of(Registrant) 
    end
  end
end



registrant_1 = Registrant.new('Bruce', 18, true )
#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

registrant_2 = Registrant.new('Penny', 15 )
#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

registrant_1.name
#=> "Bruce"

registrant_1.age
#=> 18

registrant_1.permit?
#=> true

registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

registrant_2.name
#=> "Penny"

registrant_2.age
#=> 15

registrant_2.permit?
#=> false

registrant_2.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

registrant_2.earn_permit

registrant_2.permit?
#=> true