require 'rspec'
require './lib/registrant'

describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new("Bruce", 18, true )
    @registrant_2 = Registrant.new("Penny", 15 )

  end

  describe '#initialize' do
    it 'can initialize' do

      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end
  end

  describe '#name' do
    it 'can read the name' do

      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_2.name).to eq("Penny")
    end
  end
end
