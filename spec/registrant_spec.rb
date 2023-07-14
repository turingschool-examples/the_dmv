require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new('', 0, false)
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
    end
  end

  describe '#has attributes' do
    it 'registrant 1 has attributes' do
      expect(@registrant_1).to eq(@registrant_1)
    end
  end

  describe '#has attributes' do
    it 'registrant 2 has attributes' do
      expect(@registrant_2).to eq(@registrant_2)
    end
  end

  describe '#earned permit method works' do
    it 'earned permit method works' do
      expect(@registrant_2.permit?).to be(false)
      @registrant_2.earn_permit
      # require 'pry' ; binding.pry
      expect(@registrant_2.permit?).to be(true)
    end
  end
end
