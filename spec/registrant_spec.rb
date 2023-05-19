require 'spec_helper'

RSpec.describe Registrant do
  describe "Initialize" do  
    it "exists" do 
      expect(@bruce).to be_an_instance_of Registrant
      expect(@penny).to be_an_instance_of Registrant
    end 

    it "can pass name and age as arguments" do 
      expect(@bruce.name).to eq("Bruce")
      expect(@bruce.age).to eq(18)
      expect(@penny.name).to eq("Penny")
      expect(@penny.age).to eq(15)
    end 
    
    it "permit has a default value of false that can be altered as a pass through agruement" do
      expect(@penny.permit).to be false
      expect(@bruce.permit).to be true 
    end 

    it "stores license_data as a hash with all three keys pointing to false by default" do 
      expect(@bruce.license_data[:written]).to be false 
      expect(@bruce.license_data[:drivers_license]).to be false 
      expect(@bruce.license_data[:renewed]).to be false 
    end 
  end 

  describe "instance methods" do 
    it "can return the current permit boolean" do 
      expect(@bruce.permit?).to be true
      expect(@penny.permit?).to be false 
    end 

    it "can issue permits" do 
      @penny.earn_permit
      expect(@penny.permit?).to be true
    end 
  end 
end 