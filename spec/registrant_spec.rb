require 'spec_helper'

RSpec.describe Registrant do

  describe '#initialize' do
    it 'can initialize' do
      @registrant_1 = Registrant.new('Bruce', 18, true)

      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to be true
      expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
    end
  end

  describe '#initialize another registrant' do
    it 'can initialize another registrant' do
      @registrant_2 = Registrant.new('Penny', 15)

      expect(@registrant_2).to be_an_instance_of(Registrant)
      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit?).to be false
      expect(@registrant_2.license_data).to eq({:written => false, :license => false, :renewed => false})
    end

    describe '#initialize another registrant' do
      it 'can initialize another registrant' do
        @registrant_3 = Registrant.new('Tucker', 16)

        expect(@registrant_3).to be_an_instance_of(Registrant)
        expect(@registrant_3.name).to eq('Tucker')
        expect(@registrant_3.age).to eq(16)
        expect(@registrant_3.permit?).to be false
        expect(@registrant_3.license_data).to eq({:written => false, :license => false, :renewed => false})
      end
    end
   end

  describe 'earn_permit' do
      it 'can earn a permit' do
        @registrant_2 = Registrant.new('Penny', 15)

        @registrant_2.earn_permit
        
        expect(@registrant_2.permit?).to be true      
      end

      it 'can earn a permit' do
        @registrant_3 = Registrant.new('Tucker', 16)

        @registrant_3.earn_permit
        
        expect(@registrant_3.permit?).to be true      
      end
    end
end