require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15, false)
  end
  describe '#initalize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq 'Bruce'
      expect(@registrant_1.age).to eq 18
      expect(@registrant_1.permit).to eq true
      expect(@registrant_2.permit).to eq false
      expect(@registrant_1.license_data). to eq ({written: false, license: false, renewed: false})
    end
  end

  describe 'permit?' do
    it 'can determine if a registrant has a permit' do
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end

  describe 'earn_permit' do
    it 'can earn a permit' do
      expect(@registrant_2.permit?).to be false

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be true
    end
  end


end