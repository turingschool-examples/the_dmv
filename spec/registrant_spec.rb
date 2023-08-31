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
end 
