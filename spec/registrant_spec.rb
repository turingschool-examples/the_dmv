require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end

    it 'can set name' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
    end

    it 'can set age' do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end

    it 'can set permit status' do
      expect(@registrant_1.permit).to be true
      expect(@registrant_2.permit).to be false
    end

    it 'can set license data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.license_data[:written]).to be false
      expect(@registrant_1.license_data[:license]).to be false
      expect(@registrant_1.license_data[:renewed]).to be false

      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data[:written]).to be false
      expect(@registrant_2.license_data[:license]).to be false
      expect(@registrant_2.license_data[:renewed]).to be false
    end
  end

  describe '#permit?' do
    it 'can determine if a registrant has a permit' do
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end

  describe '#earn_permit' do
    it 'can change permit status' do
      expect(@registrant_2.permit?).to be false
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to be true
    end

    it 'leaves permit status unchanged if previously earned' do
      expect(@registrant_1.permit?).to be true
      @registrant_1.earn_permit
      expect(@registrant_1.permit?).to be true
    end
  end

  describe '#written?' do
    it 'can check written test status on license_data' do
      expect(@registrant_1.written?).to be false
      expect(@registrant_2.written?).to be false
    end
  end

  describe '#license?' do
    it 'can check license status on license_data' do
      expect(@registrant_1.license?).to be false
      expect(@registrant_2.license?).to be false
    end
  end

  describe '#renewed?' do
    it 'can check renewal status on license_data' do
      expect(@registrant_1.renewed?).to be false
      expect(@registrant_2.renewed?).to be false
    end
  end

end