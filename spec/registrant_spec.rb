require 'spec_helper'

describe Registrant do
    before do
        @registrant_1 = Registrant.new('Bruce',18, true)
        @registrant_2 = Registrant.new('Penny', 15 )
    end
    describe 'initialize' do
        it 'is an instance of registrant' do
            expect(@registrant_1).to be_a Registrant
            expect(@registrant_2).to be_a Registrant
        end
    #test it exists
        it 'has a name' do 
            expect(@registrant_1.name).to eq("Bruce")
            expect(@registrant_2.name).to eq("Penny")
        end
    #test it has a name
        it 'has an age' do
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_2.age).to eq(15)
        end
    #test it has an age
        it 'has a permit?' do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
    #test it has a permit
        end
        it 'has license data' do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    #test it has license data
        end    
    end
        it 'can earn a permit' do
            @registrant_2.earn_permit
            expect(@registrant_2.permit?).to eq(true)
        end
        
end