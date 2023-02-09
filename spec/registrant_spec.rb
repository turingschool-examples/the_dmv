require 'spec_helper'

RSpec.describe Registrant do
  describe '#Iteration 1' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 15)
    end

    it 'has a name and age' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.name).to eq('Penny')
    end
  end
end