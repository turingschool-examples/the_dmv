require './lib/registrant'
require 'pry'

RSpec.describe Registrant do
  describe '#initalize' do
    it 'has name, age, permit and license status for registrant 1' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to be true
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    
    
    it 'has name, age, permit and license status for registrant 2' do
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1.name).to eq('Penny')
      expect(registrant_1.age).to eq(15)
      expect(registrant_1.permit?).to be false
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
  
  describe '#earn permit' do
    it 'earns permit and updates permit status' do
      registrant_2 = Registrant.new('Penny', 15 )

      registrant_2.earn_permit

      expect(registrant_2.permit?).to be true
    end
  end

end
