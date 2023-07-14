require './lib/registrant'

RSpec.describe Registrant do
  describe "#initialize" do
    it "exists" do
      registrant_1 = Registrant.new("Bruce", 18, true)
    end
    
    it "has a name, age, and permit status that defaults to false" do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 15)
      
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to be true
      expect(registrant_2.name).to eq("Penny")
      expect(registrant_2.age).to eq(15)
      expect(registrant_2.permit?).to be false
    end
  end
end