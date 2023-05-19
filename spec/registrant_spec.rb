require 'spec_helper'

RSpec.describe "Registrant" do

  it 'can initiliza' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15)
    
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to be true
    expect(registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
    expect(registrant_2.permit?).to be false
  end

  it 'can give permit to registrant' do
    registrant_2 = Registrant.new('Penny', 15)

    expect(registrant_2.permit?).to be false
    expect(registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    registrant_2.earn_permit
    expect(registrant_2.permit?).to be true
  end
end

#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

# registrant_1.name
# #=> "Bruce"

# registrant_1.age
# #=> 18

# registrant_1.permit?
# #=> true

# registrant_1.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# registrant_2.name
# #=> "Penny"

# registrant_2.age
# #=> 15

# registrant_2.permit?
# #=> false

# registrant_2.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# registrant_2.earn_permit

# registrant_2.permit?
# #=> true