require './spec/spec_helper'

describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Matt', 18)
    @registrant_2 = Registrant.new('Kristen', 16, true)
  end
  describe '#initialization' do
    it 'is instantiated with a name and age' do
      expect(@registrant_1).to be_a Registrant
      expect(@registrant_1.name).to eq('Matt')
      expect(@registrant_1.age).to eq(18)
    end
    it 'might be created with a permit' do
      expect(@registrant_1.permit?).to be false
      expect(@registrant_2.permit?).to be true
    end
  end
  describe '#earn_permit' do
    it 'can get a permit' do
      @registrant_1.earn_permit
      expect(@registrant_1.permit?).to be true
    end
  end
end