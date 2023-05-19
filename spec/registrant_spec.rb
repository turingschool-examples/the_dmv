require 'spec_helper'

RSpec.describe Registrant do

  describe "Initialize" do  
    it "exists" do 
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_2).to be_an_instance_of Registrant
    end 

    it "can pass name and age as arguments" do 
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.name).to eq("Penny")
      expect(@registrant_2.age).to eq(15)
    end 
    
    it "permit has a default value of false that can be altered as a pass through agruement" do
      expect(@registrant_2.permit).to be false
      expect(@registrant_1.permit).to be true 
    end 

    it "stores license_data as a hash with all three keys pointing to false by default" do 
      expect(@registrant_1.license_data[:written]).to be false 
      expect(@registrant_1.license_data[:drivers_license]).to be false 
      expect(@registrant_1.license_data[:renewed]).to be false 
    end 
  end 

  describe "instance methods" do 
    it "can return the current permit boolean" do 
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false 
    end 

    it "can issue permits" do 
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to be true
    end 
  end 
end 