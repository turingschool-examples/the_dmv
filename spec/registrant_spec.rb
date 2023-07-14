require 'spec_helper'

describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "#permit?" do
    it "can tell if a registrant is permitted" do
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end

  describe "#earn_permit" do
    it "can grant a permit to a non-permitted registrant" do
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be true
    end
  end

  describe "#pass_written" do
    it "can pass the written test" do
      @registrant_1.pass_written

      expect(@registrant_1.license_data[:written]).to be true
    end
  end

  describe "#get_license" do
    it "can get a license" do
      @registrant_1.get_license

      expect(@registrant_1.license_data[:license]).to be true
    end
  end

  describe "#renew_license" do
    it "can renew a license" do
      @registrant_1.renew_license

      expect(@registrant_1.license_data[:renewed]).to be true
    end
  end
end