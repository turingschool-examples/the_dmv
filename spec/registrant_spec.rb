require "spec_helper"
require "./lib/registrant"

describe "Registrant" do
  before(:each) do
    @registrant_1 = Registrant.new("Bruce", 18, true)
    @registrant_2 = Registrant.new("Penny", 15)
  end

  describe "#initialize" do
    it "exists" do
      expect(@registrant_1).to be_a(Registrant)
      expect(@registrant_2).to be_a(Registrant)
    end

    it "has a @name" do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_2.name).to eq("Penny")
    end

    it "has an @age" do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end
    
    it "has @license_data as a Hash" do
      expect(@registrant_1.license_data).to be_a(Hash)
      expect(@registrant_2.license_data).to be_a(Hash)
    end
    
    it "has not passed a written test when created" do
      expect(@registrant_1.license_data[:written]).to be false
      expect(@registrant_2.license_data[:written]).to be false
    end
    
    it "does not start with a license" do
      expect(@registrant_1.license_data[:license]).to be false
      expect(@registrant_2.license_data[:license]).to be false
    end
    
    it "does not need its license renewed when created" do
      expect(@registrant_1.license_data[:renewed]).to be false
      expect(@registrant_2.license_data[:renewed]).to be false
    end
  end

  describe "#permit?" do
    it "can start with a permit" do
      expect(@registrant_1.permit?).to be true
    end
    
    it "doesn't have a permit by default" do
      expect(@registrant_2.permit?).to be false
    end
  end
  
  describe "#earn_permit" do
    it "can earn a permit" do
      expect(@registrant_2.permit?).to be false

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be true
    end
  end

  describe "#pass_written_test" do
    it "can pass a written test" do
      expect(@registrant_1.license_data[:written]).to be false

      @registrant_1.pass_written_test

      expect(@registrant_1.license_data[:written]).to be true
    end
  end
end