require 'spec_helper'

RSpec.describe Registrant do 
  before(:each) do 
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end
  describe '#initialize' do
    it 'can initialize' do 
      expect(@registrant_1).to be_a Registrant
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to be true
      expect(@registrant_2.permit).to be false
    end
  end
  describe '#permit?' do
    it 'can determine if a registrant has a permit' do 
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end
  describe '#read_license_data' do
    it 'has default false has key attributes written, license, renewed' do 
      expect(@registrant_1.read_license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.read_license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#earn_permit' do
    it 'updates permit status to true' do 
      expect(@registrant_2.permit?).to be false

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be true
    end
  end

  describe '#written_pass' do 
    it 'updates license data after written test' do 
      expect(@registrant_1.read_license_data[:written]).to be false
      
      @registrant_1.written_pass

      expect(@registrant_1.read_license_data[:written]).to be true
    end
  end
end