require './lib/registrant.rb'

describe Registrant do

    describe "#initialize" do 
        it "exists" do
            registrant = Registrant.new("Bruce", 18, true)

            expect(registrant).to be_a Registrant
        end

        it "instantiates variables and defaults @permit to false" do
            registrant_1 = Registrant.new("Bruce", 18, true)
            registrant_2 = Registrant.new("Penny", 15)

            expect(registrant_1.name).to eq("Bruce")
            expect(registrant_1.age).to eq(18)
            expect(registrant_1.permit).to eq(true)
            expect(registrant_1.license_data).to be_a Hash
            expect(registrant_2.permit).to eq(false)
        end
    end

    describe "#permit?" do
        it "returns true/false for registrant with/without permit" do
            registrant_1 = Registrant.new("Bruce", 18, true)
            registrant_2 = Registrant.new("Penny", 15)

            expect(registrant_1.permit?).to eq(true)
            expect(registrant_2.permit?).to eq(false)
        end
    end

    describe "#earn_permit" do
        it "sets registrant permit variable to true" do
            registrant = Registrant.new("Penny", 15)

            expect(registrant.permit?).to eq(false)

            registrant.earn_permit

            expect(registrant.permit?).to eq(true)
        end
    end
end