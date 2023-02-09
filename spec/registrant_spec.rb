require 'rspec'
require './lib/registrant'

RSpec.describe Registrant do

  describe 'Functional Registrant class' do
    it 'can initialize' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    
    expect(registrant_1).to be_an_instance_of(Registrant)
    end

  
    it 'Has proper name, age, and permit data' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    

    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.name).to eq("Penny")
    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(15)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_2.permit?).to eq(false)
    end
  


    it 'Has license data' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  

    it 'Has functional earn_permit' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    registrant_2.earn_permit

    expect(registrant_2.permit?).to eq(true)
    end
  end
end




