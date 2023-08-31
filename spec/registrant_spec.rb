require './lib/registrant'


RSpec.describe Registrant do 
    describe 'initialize' do 
        it 'creates registrant with attributes' do
            registrant = Registrant.new('Bruce', 18, true )
            
            expect(registrant.name).to eq('Bruce')
            expect(registrant.age).to eq(18)
            expect(registrant.permit?).to be(true)
            expect(registrant.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end   
    end 

    it 'registrant without a permit' do 
        registrant = Registrant.new('Penny',15)
        expect(registrant.name).to eq('Penny')
        expect(registrant.age).to eq(15)
        expect(registrant.permit?).to be(false)
        expect(registrant.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end 

    describe 'earn permit' do 
        it 'chnages the permit status to false'do 
          registrant = Registrant.new('Penny',15)
          expect(registrant.permit?).to be(false)
        end 
    end 
    



end 

