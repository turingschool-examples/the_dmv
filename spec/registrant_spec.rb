require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
  @registrant_1 = Registrant.new(@age = 18, @name = 'Bruce', @permit = true)
  @registrant_2 = Registrant.new(@age = 15, @name = 'Penny', @permit = false)
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
    it 'can initialize registrant_1' do
      expect(@registrant_2).to be_an_instance_of(Registrant)
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.license_data[:written]).to be false
      expect(@registrant_2.license_data[:license]).to be false
      expect(@registrant_2.license_data[:renewed]).to be false
      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.permit).to be false
    end
  end
end