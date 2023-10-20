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
end