require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new("Bruce", 18, true)
        @registrant_2 = Registrant.new("Penny", 15)
    end

    describe "#initialize" do
        
        it 'exists' do
        expect(@registrant_1).to be_an_instance_of(Registrant)
        end

        it "has a name" do
            expect(@registrant_1.name).to eq("Bruce")
        end

        it "has an age" do
            expect(@registrant_1.age).to eq(18)
        end

        it "has permit by default" do
            expect(@registrant_1.permit).to be true
        end
    end

    describe "#permit?" do
        it "can determine if registrant has a permit" do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe "#earn_permit" do
        it "can change if registrant has a permit" do
            expect(@registrant_1.earn_permit).to eq(true)
            expect(@registrant_2.earn_permit).to eq(true)
        end
    end
end

