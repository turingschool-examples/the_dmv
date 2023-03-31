require 'spec_helper'

RSpec.describe Registrant do 
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end
  
  describe "Iteration 1" do

    it "exists" do

      expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it "has a name" do

      expect(@registrant_1.name).to eq("Bruce")
    end

    it "has an age" do

      expect(@registrant_1.age).to eq(18)
    end

    it "has a permit? attribute" do

      expect(@registrant_1.permit?).to be(true)
    end

    it "has a license data attribute" do

      expected = {
        :written=>false, 
        :license=>false, 
        :renewed=>false 
      }

      expect(@registrant_1.license_data).to eq(expected)
      #=> {:written=>false, :license=>false, :renewed=>false}
    end 

    it "permit is false by default" do 

      # expect(@registrant_2.name).to eq("Penny")
      # expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit?).to be(false)

      # expected_2 = {
      #   :written=>false, 
      #   :license=>false, 
      #   :renewed=>false
      # }

      # expect(@registrant_2.license_data).to eq(expected_2)
      #=> {:written=>false, :license=>false, :renewed=>false}
    end
    
    it "has an earn_permit method" do
      #registrant 2 is 15 years old. She shouldn't be able to earn_permit
      expect(@registrant_2.permit?).to be(false)
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(true)
    end
  end
end