require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe "#exists" do
    it "exists" do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end
  end

  describe "#attributes" do
    it "has name and age attributes" do
      expect(@registrant_1.name).to eq "Bruce"
      expect(@registrant_1.age).to eq 18
    end
    it "has default permit and license_data values" do
      data = {
        written: false, 
        license: false, 
        renewed: false 
      }
      expect(@registrant_1.license_data).to eq(data)
      expect(@registrant_1.permit?).to be true
    end
  end
end