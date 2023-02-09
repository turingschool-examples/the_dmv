require 'spec_helper'

RSpec.describe Registrant do
  describe '#Iteration 1' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 15)
    end

    it 'has a name and age' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.name).to eq('Penny')
    end

    it 'has no permit by default' do
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
    end

    it 'has license_data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can earn a permit' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end
end