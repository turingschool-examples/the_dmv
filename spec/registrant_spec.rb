require './lib/registrant'

RSpec.describe Registrant do 
  describe "#initialize" do 
    it "exists" do
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1).to be_a Registrant
      expect(registrant_2).to be_a Registrant
    end
    
    it "has an age, name and permit" do 
      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to eq(true)
    end
  end
end