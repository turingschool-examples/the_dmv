require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
      expect(@registrant.name).to eq('Bruce')
      expect(@registrant.age).to eq(18)
      expect(@registrant.permit).to eq(true)
      expect(@registrant.license_data).to eq({:written => false, :license => false, :renewed => false})
      expect(@registrant_2.permit).to eq(false)
    end
  end


end