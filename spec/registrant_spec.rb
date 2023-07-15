require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_a(Registrant)
      expect(@registrant_2).to be_a(Registrant)
    end
  end

  describe "#permit?" do
    it "confirms that registrant has a permit" do
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe "#license_data" do
    it "boolean to determine written, license, and renewed" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "#earn_permit" do
    it "adds permit if not yet earned" do
      expect(@registrant_2.permit?).to eq(false)

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(true)
    end
  end
end