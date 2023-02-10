require 'spec_helper'

RSpec.describe Registrant do

  describe '#initialize' do
    it 'can initialize' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)

      expect(registrant_1).to be_a(Registrant)
      expect(registrant_2).to be_a(Registrant)
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
    end
  end

  describe '#permit?' do
    it 'can have a permit' do
      registrant_1 = Registrant.new('Bruce', 18, true)

      expect(registrant_1.permit?).to be true
    end

    it 'defaults to no permit' do
      registrant_2 = Registrant.new('Penny', 15)

      expect(registrant_2.permit?).to be false
    end
  end
end
