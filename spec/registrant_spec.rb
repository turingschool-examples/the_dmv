require 'rspec'
require './lib/registrant'

RSpec.describe Registrant do

  describe "#initialize" do

    it 'exists' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    
    expect(registrant_1).to be_a(Registrant)
    end

    it 'exists 2' do
      registrant_2 = Registrant.new('Penny', 15)
    
      expect(registrant_2).to be_a(Registrant)
    end
  end

  describe "#registers registrants" do
    it 'registers a name' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)
      
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_2.name).to eq("Penny")
    end
    
    it 'registers an age' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)
      
      expect(registrant_1.age).to eq(18)
      expect(registrant_2.age).to eq(15)
    end
    
    it 'registers permit status' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)
      
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
    end
    
    it 'registers license data' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)
      
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    
    it 'earned a permit?' do
      registrant_2 = Registrant.new('Penny', 15)
      registrant_2.earn_permit
      
      expect(registrant_2.permit?).to eq(true)
    end
  end
end
  #expect().to eq()
