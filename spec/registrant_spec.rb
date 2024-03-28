require 'spec_helper'

RSpec.describe Registrant do
    before (:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
    end

    describe 'initialize' do
        it 'can initialize' do
            expect(@registrant_1).to be(Registrant)
        end
    end
end
