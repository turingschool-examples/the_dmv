require 'spec_helper'

RSpec.describe Registrant do
  let(:registrant_1) { Registrant.new('Bruce', 18, true ) }
  let(:registrant_2) { Registrant.new('Penny', 15) }
  describe 'initialize' do
    it 'can initialize' do
      expect(registrant_1).to be_an_instance_of(Registrant) 
    end

    it 'can have a name' do
      expect(registrant_1.name).to eq('Bruce')
    
      expect(registrant_2.name).to eq('Penny')
    end
    
    it 'can have an age' do
      expect(registrant_1.age).to eq(18)
    
      expect(registrant_2.age).to eq(15)
    end
    
    it 'has no permit by default' do
      expect(registrant_2.permit?).to be false
    end
    
    it 'can have a permit when instantiated' do
      expect(registrant_1.permit?).to be true
    end
    
    it 'has not passed the written test, got their license or renewed their license by default' do
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
end