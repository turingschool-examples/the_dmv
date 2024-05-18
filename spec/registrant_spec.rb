require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new(@name, @age, @permit = false)
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
      expect(@permit).to be false
    end
  end

  describe 'license data' do
    it 'has no license data by default' do
      expect(@registrant.license_data).to eq({:written => false, :license => false, :renewed => false})
    end
  end

  describe 'gets a permit' do
    it 'earns a permit' do
      expect(@registrant.earn_permit).to be true
    end
  end

end
