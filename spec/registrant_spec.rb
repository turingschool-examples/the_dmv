require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end
    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant_1).to be_an_instance_of Registrant
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to eq(18)
        end
    end
    describe 'permit?' do
        it 'returns true if the registrant has permit' do
            expect(@registrant_1.permit?).to permit(true)
            expect(@registrant_2.permit?).to permit(false)
        end
    end

end