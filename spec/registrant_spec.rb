require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Penny', 15)
    @registrant_2 = Registrant.new('Bruce', 18, true)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1.name).to eq('Penny')
      expect(@registrant_1.age).to be 15
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can initialize a different person' do
      expect(@registrant_2.name).to eq('Bruce')
      expect(@registrant_2.age).to be 18
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#permit?' do
    it 'has default no permit ' do
      expect(@registrant_1.permit?).to be false
    end

    it 'has flexible input permit status' do
      expect(@registrant_2.permit?).to be true
    end
  end

  describe '#earn_permit?' do
  it 'can earn permit ' do
    expect(@registrant_1.permit?).to be false
    @registrant_1.earn_permit
    expect(@registrant_2.permit?).to be true
  end

  it 'has permit, earn permit, still has permit' do
    expect(@registrant_2.permit?).to be true
    @registrant_1.earn_permit
    expect(@registrant_2.permit?).to be true
  end
end
end