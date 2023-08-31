require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do #how does scope this work, where does the end go
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant) 
    end
    it 'can store a name' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
    end
    it 'can store an age' do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end
    it 'can store permit status but is false by default' do
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_2.permit).to eq(false)
    end
  end
  describe '#earn_permit' do  
    it '#earn_permit changes permit status to true' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit).to eq(true)
    end
  end
end