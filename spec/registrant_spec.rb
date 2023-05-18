require './lib/registrant'


RSpec.describe "Registrant" do
  describe '#exists' do
    it 'exists' do
      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(registrant_1).to be_a(Registrant)
    end

    it "has readable attributes" do
      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)


    end

    it "permit is false by default" do
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_2.permit?).to eq(false)
    end

    it "can start with a different permit value" do
      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(registrant_1.permit?).to eq(true)
    end

    it "has license data" do
      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "earn_permit" do
    it "can earn a permit" do
      registrant_2 = Registrant.new('Penny', 15 )

      registrant_2.earn_permit
      expect(registrant_2.permit?).to eq(true)
    end
  end
end