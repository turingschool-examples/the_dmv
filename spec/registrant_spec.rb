require './lib/registrant'

RSpec.describe Registrant do
  describe "Initialize" do
    it "creates a registrant" do
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.license_data).to eq(
        {:written=>false, 
      :license=>false, 
      :renewed=>false})
    end
  end
end