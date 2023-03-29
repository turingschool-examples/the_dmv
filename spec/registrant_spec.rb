require 'spec_helper'

RSpec.describe Registrant do 
  before(:each) do 
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end
  describe '#initialize' do
    it 'can initialize' do 
      expect(@registrant_1).to be_a Registrant
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to be true
      expect(@registrant_2.permit).to be false
    end
  end
  describe 'permit?' do
    it 'can determine if a registrant has a permit' do 
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end

  it 'has a license data attribute with false default values' do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
  end

end