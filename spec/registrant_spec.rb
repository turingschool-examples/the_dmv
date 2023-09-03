require './lib/registrant'
require 'spec_helper'

RSpec.describe Registrant do
  describe '#initialize' do
    it 'can initialize' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1).to be_an_instance_of(Registrant)
      expect(registrant_2).to be_an_instance_of(Registrant)
    end

    it 'has a name' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_2.name).to eq('Penny')
    end
    
    it 'has an age' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1.age).to eq(18)
      expect(registrant_2.age).to eq(15)
    end
    
    it 'has a permit' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      expect(registrant_1.permit).to eq(true)
      expect(registrant_2.permit).to eq(false)
    end
    
    it 'has license data' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      expect(registrant_1.license_data).to be_an_instance_of(Hash)
      expect(registrant_2.license_data).to be_an_instance_of(Hash)
    end
    it 'can earn a permit' do
      
      registrant_2 = Registrant.new('Penny', 15 )
      expect(registrant_2.permit).to eq(false)
      registrant_2.earn_permit
      expect(registrant_2.permit).to eq(true)

    end
  end
end