require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15, false)
    @registrant_3 = Registrant.new('Tucker', 15)
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

  describe 'earn_a_permit' do
    it 'can determine if a registrant has a permit' do
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end

    it 'can earn a permit' do
      expect(@registrant_2.permit?).to be false

      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be true
    end
  end

  describe 'pass_written_test' do
    before(:each) do
      @registrant_1.earn_permit
    end
    
    it 'can pass_written_test' do
      expect(@registrant_1.written?).to be false
      
      @registrant_1.pass_written_test
      
      expect(@registrant_1.written?).to be true
    end
  end

  describe 'pass_road_test' do
    before(:each) do
      @registrant_1.earn_permit
      @registrant_1.pass_written_test
    end
    it 'can pass_road_test' do
      expect(@registrant_1.license?).to be false

      @registrant_1.pass_road_test

      expect(@registrant_1.license?).to be true
    end
  end

  describe 'renew_license' do
    it 'cannot renew license without a license' do
      expect(@registrant_1.license_data[:license]).to be false
      expect(@registrant_1.renew_license).to be nil
    end

    it 'can renew license' do
      @registrant_1.license_data[:license] => true
      expect(@registrant_1.license_data[:renewed]).to be true
    end
  end

end