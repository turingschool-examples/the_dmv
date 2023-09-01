require 'spec_helper'

describe 'Registrant' do
    it 'can add a new registrant 1' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        expect(registrant_1.name).to eq("Bruce")
        expect(registrant_1.age).to eq(18)
        expect(registrant_1.permit?).to eq(true)
    end

    it 'automates when registering individual 1 to default to false written, license, and renewed status' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false}        )
    end

    it 'can add a new registrant 2' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        expect(registrant_2.name).to eq("Penny")
        expect(registrant_2.age).to eq(15)
        expect(registrant_2.permit?).to eq(false)
    end

    it 'automates when registering individual 2 to default to false written, license, and renewed status' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'changes the permit status of registrant 2 when method is called' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        registrant_2.earn_permit
        expect(registrant_2.permit?).to eq(true)
    end
end