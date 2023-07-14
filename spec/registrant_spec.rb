require './lib/registrant'

RSpec.describe Registrant do
  describe "#initialize" do
    it "exists" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1).to be_a Registrant
      expect(registrant_2).to be_a Registrant
    end
  end

  describe "#name" do
    it "returns registrant name" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_2.name).to eq("Penny")
    end
  end

  describe "#age" do
    it "returns registrant age" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1.age).to eq(18)
      expect(registrant_2.age).to eq(15)
    end
  end
  
  describe "#permit?" do
    it "returns whether or not registrant has a permit" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
    end
  end
  
  describe "#license_data" do
    it "returns license data hash" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
  
  xdescribe "#earn_permit" do
    it "it gives registrant a permit" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      registrant_2.earn_permit

      expect(registrant_2.permit?).to be true
    end
  end
end