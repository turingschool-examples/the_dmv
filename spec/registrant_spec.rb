require './lib/registrant'
require 'spec_helper'

RSpec.describe Registrant do
  describe "Iteration 1" do
    it "exists and has attributes" do
      registrant_1 = Registrant.new("Bruce", 18, true )
      registrant_2 = Registrant.new("Penny", 15 )

      expect(registrant_1).to be_a(Registrant)
      expect(registrant_2).to be_a(Registrant)

      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)

      expect(registrant_2.name).to eq("Penny")
      expect(registrant_2.age).to eq(15)
    end

    it "tests for if the registrant has a permit" do
      registrant_1 = Registrant.new("Bruce", 18, true )
      registrant_2 = Registrant.new("Penny", 15 )

      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)  
    end
    
    it "tests for license_data" do
      registrant_1 = Registrant.new("Bruce", 18, true )
      registrant_2 = Registrant.new("Penny", 15 )
      
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})  
    end

    it "tests for earn_permit" do
      registrant_1 = Registrant.new("Bruce", 18, true )
      registrant_2 = Registrant.new("Penny", 15 )
      registrant_1.earn_permit
      registrant_2.earn_permit
      
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(true)
    end
  end



end

