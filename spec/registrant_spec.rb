require 'spec_helper'

  RSpec.describe Registrant do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 15 )
    end

    it "initialize" do
      expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it "can have a name" do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      
      expect(@registrant_1.name).to eq('Bruce')
    end
  end