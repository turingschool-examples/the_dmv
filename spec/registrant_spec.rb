require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'exists' do
      expect(@registrant_1).to be_a(Registrant)
    end
  end

  describe '#name & age' do
    it 'returns registrants name & age' do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
    end
  end

  describe '#Permit?' do
    it 'tells us if the registrant_1 has a permit' do
      expect(@registrant_1.permit?).to eq(true)

      expect(@registrant_1.license_data).to eq({:written=>false, 
      :license=>false, :renewed=>false})
    end

    it 'tells us if registrant_2 has a permit' do
      expect().to eq()
    end
  end
end