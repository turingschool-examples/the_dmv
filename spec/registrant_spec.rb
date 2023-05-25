require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new('Bruce', 18)
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
      expect(@registrant.name).to eq('Bruce')
      expect(@registrant.age).to eq(18)
      expect(@registrant.permit).to eq(false)
      expect(@registrant.licence_data).to eq({:written => false,
        :licence => false,
        :renewed => false,
        })
    end
  end

  describe 'permit' do
    it 'can earn permit' do
      expect(@registrant.permit?).to eq(false)
      @registrant.earn_permit
      expect(@registrant.permit?).to eq(true)
  end
end

  describe 'test' do
    it 'can write tests' do
            expect(@registrant.test_written?).to eq(false)
            @registrant.write_test
            expect(@registrant.test_written?).to eq(true)
            expect(@registrant.road_test?).to eq(false)
            @registrant.road_test
            expect(@registrant.road_test?).to eq(true)
    end
    
    it 'can renew licence' do
        expect(@registrant.renew_licence).to eq(true)
    end
end
end
