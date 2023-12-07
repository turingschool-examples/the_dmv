require './lib/registrant'

describe Registrant do
   before(:each) do
      @bruce = Registrant.new('Bruce', 18, true)
      @penny = Registrant.new('Penny', 15)
   end

   describe 'initialize' do
      it 'exists' do
         expect(@bruce).to be_a Registrant
      end
   end
end