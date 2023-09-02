require 'spec_helper'
require './lib/registrant'
require 'pry'

RSpec.describe Registrant do

  describe '#initialize' do
    it 'creates new registrant' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(registrant_1).to be_a Registrant
    end
  end
  
  describe '#initialize2' do
    it 'creates registrant no permit' do
      registrant_2 = Registrant.new('Penny', 15 )
      expect(registrant_2).to be_a Registrant
      expect(registrant_2.permit).to eq(false)
    end
  end
  describe 'attributes' do
    it 'returns registrant attributes' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(registrant_1.name).to eq("Bruce") 
      expect(registrant_1.age).to eq(18) 
      expect(registrant_1.permit).to eq(true) 
    end
  end
end
