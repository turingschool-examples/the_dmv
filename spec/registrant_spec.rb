require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end
  end 

  describe '#add registrant information' do
    it 'can add registrant information' do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to be true
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.name).to eq("Penny")
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit?).to be false
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be true
    end
  end 
end