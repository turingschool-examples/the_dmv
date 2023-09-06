require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new(@name = 'Bruce', @age = 18, @permit = true)
    @registrant_2 = Registrant.new(@name = 'Penny', @age = 16,  @permit = false)
    @registrant_3 = Registrant.new(@name = 'Tucker', @age = 15, @permit = false )
  end
  
  describe '#initialize reg_1' do
    it 'can initialize registrant_1' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.license_data[:written]).to be false
      expect(@registrant_1.license_data[:license]).to be false
      expect(@registrant_1.license_data[:renewed]).to be false
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.permit).to be true
    end
  end

  describe '#initialize reg_2' do
    it 'can initialize registrant_2' do
      expect(@registrant_2).to be_an_instance_of(Registrant)
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.license_data[:written]).to be false
      expect(@registrant_2.license_data[:license]).to be false
      expect(@registrant_2.license_data[:renewed]).to be false
      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.permit).to be false
    end
  end

  describe '#initialize reg_3' do
    it 'can initialize registrant_3' do
      expect(@registrant_3).to be_an_instance_of(Registrant)
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.license_data[:written]).to be false
      expect(@registrant_3.license_data[:license]).to be false
      expect(@registrant_3.license_data[:renewed]).to be false
      expect(@registrant_3.name).to eq('Tucker')
      expect(@registrant_3.permit).to be false
    end
  end

  describe '#earn permit' do
    it 'changes permit status' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit).to be true
      @registrant_3.earn_permit
      expect(@registrant_3.permit).to be true
    end
  end
end