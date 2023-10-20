require './lib/registrant.rb'

describe Registrant do

    describe "#initialize" do
        
        it "exists" do
            registrant = Registrant.new("Bruce", 18, true)

            expect(registrant).to be_a Registrant
        end

        it "instantiates variables and defaults @permit to false" do
            registrant = Registrant.new("Bruce", 18, true)

            expect(registrant.name).to eq("Bruce")
            expect(registrant.age).to eq(18)
            expect(registrant.permit).to eq(true)
            expect(registrant.license_data).to be_a Hash
        end
    end
end