require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe "#initialize" do

    it "has a name" do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_2.name).to eq("Penny")

    end

    it "has an age" do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end

  end

  describe "#permit?" do

    it "has a permit if defined in #initialize" do
    
      expect(@registrant_1.permit?).to be_truthy
    end

    it "does not have a permit by default" do

      expect(@registrant_2.permit?).to be_falsy
    end
  end

  describe "#license_data" do

    it "stores license data values as false by default" do

      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "#earn_permit" do
    it "changes permit to true when earn_permit is called" do

      expect(@registrant_2.permit?).to eq(false)

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(true)
    end

  end
end