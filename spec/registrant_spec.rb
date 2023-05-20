require './lib/registrant'

RSpec.describe Registrant do
  describe "Initialize" do
    it "creates a registrant" do
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_1.license_data).to eq(
        {:written=>false, 
      :license=>false, 
      :renewed=>false})
    end
    it "can add registrants with different attributes" do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15 )
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_2.name).to eq("Penny")
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
    end
  end
end