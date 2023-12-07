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

         expect(@penny.name).to eq "Penny"
      end

      it 'has an age' do
         expect(@bruce.age).to eq 18

         expect(@penny.age).to eq 15
      end

      it 'can have a permit' do 
         expect(@bruce.permit?).to eq true

         expect(@penny.permit?).to eq false
      end

      it 'has license-data' do
         expect(@bruce.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      end
   end

   describe '#earn_permit' do
      it 'allow registrant to get permit' do
         expect(@penny.permit?).to eq false

         @penny.earn_permit

         expect(@penny.permit?).to eq true
      end
   end
end