require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new("Bruce", 18, true)
    @registrant_2 = Registrant.new("Penny", 15)
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
    end
  end

  describe "#permit?" do
    it "can check if a registrant has their permit" do
      expect(@registrant_1.permit?).to be(true)
      expect(@registrant_2.permit?).to be(false)
    end
  end

  describe "#license_data" do
    it "can determine if a registrant is eligible for their license" do 
      expect(@registrant_1.license_data).to eq(written: false, 
      license: false, 
      renewed: false)
    end
  end

end
