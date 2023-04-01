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

      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
    end

    it "can have an age" do

      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end

    it "can check permit status" do

      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
    end

    it "can check license data" do

      expected = {
                  written:   false,
                  licensed:  false,
                  renewed:   false
                  }       
      expect(@registrant_1.license_data).to eq(expected)
      expect(@registrant_2.license_data).to eq(expected)
    end

    it "can earn a permit" do

      expect(@registrant_2.permit?).to eq(false)

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(true)
    end
  end