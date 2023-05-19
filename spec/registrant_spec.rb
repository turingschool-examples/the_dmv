require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end
 
  describe Registrant do
    it 'calls names' do
      expect(@registrant_1.name).to eq('Bruce')
    end
  end
end
