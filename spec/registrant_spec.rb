require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
    before (:each) do
        @registrant_1 = Registrant.new("Bruce", 18, true)
        @registrant_2 = Registrant.new("Penny", 15)
    end

    it "can initialize" do
        expect(@registrant_1).to be_an_instance_of(Registrant)
        expect(@registrant_1.name).to eq("Bruce")
        expect(@registrant_1.age).to eq(18)
        expect(@registrant_1.permit?).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it "returns true if true provided in permit parameter" do
        expect(@registrant_1.permit?).to eq(true)
    end

    it "defaults to false if no value provided for permit" do
        expect(@registrant_2.permit?).to eq(false)
    end
    
    it "allows registrants to earn their permit" do
        @registrant_2.earn_permit
        expect(@registrant_2.earn_permit).to eq(true)
    end
end