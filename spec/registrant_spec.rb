require 'spec_helper'
require './lib/registrant'
require './lib/facility'

RSpec.describe Registrant do
    describe '#initialize' do
        it 'can initialize' do
            registrant_1 = Registrant.new('Bruce', 18, true )
            registrant_2 = Registrant.new('Penny', 15 )

            expect(registrant_1).to be_a(Registrant)
            expect(registrant_2).to be_a(Registrant)
        end
    end

    describe '#name' do
        it 'can return a name' do
            registrant_1 = Registrant.new('Bruce', 18, true )
            registrant_2 = Registrant.new('Penny', 15 )
        
            expect(registrant_1.name).to eq("Bruce")
            expect(registrant_2.name).to eq("Penny")
        end
    end

    describe '#age' do
        it 'can return an age' do
            registrant_1 = Registrant.new('Bruce', 18, true )
            registrant_2 = Registrant.new('Penny', 15 )
        
            expect(registrant_1.age).to eq(18)
            expect(registrant_2.age).to eq(15)
        end
    end

    describe '#permit?' do
        it 'can return a boolean if registrant has a permit' do
            registrant_1 = Registrant.new('Bruce', 18, true )
            registrant_2 = Registrant.new('Penny', 15 )
       
            expect(registrant_1.permit?).to eq(true)
            expect(registrant_2.permit?).to eq(false)
        end
    end

    describe '#license_data' do 
        it 'can return the correct info in a hash' do
            registrant_1 = Registrant.new('Bruce', 18, true )
            registrant_2 = Registrant.new('Penny', 15 )
       
            expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

    describe '#earn_permit' do
        it 'can allow a registrant to earn a permit' do
            registrant_2 = Registrant.new('Penny', 15 )
    
            expect(registrant_2.permit?).to eq(false)
            registrant_2.earn_permit
            expect(registrant_2.permit?).to eq(true)
        end
    end
end