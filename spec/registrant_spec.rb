require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        registrant_1 = Registrant.new('Bruce', 18, true)
        registrant_2 = Registrant.new('Penny', 15)
    end

    it 'exists' do
        expect(registrant_1).to be_an_instance_of(Registrant)
    end
    
    it 'can earn a permit' do
        expect(registrant_2.earn_permit).to be true
    end

end