Require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do
        @registrant = Registrant.new 



    end

    describe '#initialize' do 
        it 'can initialize' do 
            expect(@registrant).to be_an_instance_of(Registrant)
        end
    end 
     
end
