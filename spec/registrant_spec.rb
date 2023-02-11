require 'rspec'
require './lib/registrant'

RSpec.describe Registrant do
   
  it 'exist' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    # require 'pry'; binding.pry
    expect(registrant_1).to be_a Registrant
    expect(registrant_2).to be_a Registrant
  end

  it 'registrant has a name' do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.name).to eq("Penny")
  end

  it 'registrant has an age' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(15)
  end

  it 'registrant has a permit' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.permit?).to be true
    expect(registrant_2.permit?).to be false
  end

  it 'registrants have liscene data' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    # require 'pry'; binding.pry
    expect(registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    expect(registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end






end