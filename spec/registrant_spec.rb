require 'spec_helper'

RSpec.describe Registrant do
    before (:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
    end

    it 'can initialize' do
            expect(@registrant_1).to be_a(Registrant)
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to be(18)
            expect(@registrant_1.permit).to be(true)
    end
end
