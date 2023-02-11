require './lib/registrant'

RSpec.describe Registrant do

  it 'can create an instance' do 
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1).to be_an_instance_of Registrant
    expect(registrant_2).to be_an_instance_of Registrant
  end
  
  it 'has a name' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    
    expect(registrant_1.name).to eq("Bruce")
  end
  
  it 'has an age' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    
    require 'pry'; binding.pry
    expect(registrant_1.age).to eq(18)
  end

  it 'returns true or false for permit?' do
    registrant_1 = Registrant.new('Bruce', 18, true)

    expect(registrant_1.permit?).to eq(true)
  end

  it 'has license data' do
    registrant_1 = Registrant.new('Bruce', 18, true)

    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
end