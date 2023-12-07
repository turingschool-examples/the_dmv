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

      it 'has a name' do
         expect(@bruce.name).to eq "Bruce"
      end

      it 'has an age' do
         expect(@bruce.age).to eq 18
      end

      it 'can have a permit' do 
         expect(@bruce.permit).to eq true

         expect(@penny.permit).to eq false
      end
   end
end