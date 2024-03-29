require "./lib/registrant"

RSpec.describe Registrant do
    it "exists" do
        registrant_1 = Registrant.new("Bruce", 18, true )

        expect(registrant_1).to be_instance_of(Registrant)
    end

    it "exists 2" do
        registrant_2 = Registrant.new("Penny", 15)

        expect(registrant_2).to be_instance_of(Registrant)
    end

end