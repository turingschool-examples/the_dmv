require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'can initialize another person' do
      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit).to eq(false)
      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    end
  end

  describe '#permit?' do
    it 'can determine if registrant has a permit' do
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe '#earn_permit' do
    it 'can change a permit to true if registrant is at least 16 years old' do
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(true)
    end

    it 'does not allow registrant to earn permit if under 16 years old' do
      registrant_3 = Registrant.new('Sally', 10)
      registrant_3.earn_permit

      expect(registrant_3.permit?).to eq(false)
    end
  end
end
