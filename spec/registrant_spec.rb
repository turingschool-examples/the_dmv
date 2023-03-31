require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe 'Iteration 1' do
    it 'initializes new registrants' do
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_2).to be_an_instance_of Registrant
    end

    it 'has attibutes' do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(15)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

    end



  end








end