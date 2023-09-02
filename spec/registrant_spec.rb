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

end

  


# registrant_2 = Registrant.new('Penny', 15 )