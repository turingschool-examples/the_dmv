require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe "initialize" do 
    it "initializes registrants" do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
      expect(@registrant_3).to be_an_instance_of(Registrant)

      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to eq(true)

      expect(@registrant_2.name).to eq("Penny")
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)

      expect(@registrant_3.name).to eq("Tucker")
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
    end
    
    it "can call license_data" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it "can administer written test" do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)

      facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end
  end

  
end

