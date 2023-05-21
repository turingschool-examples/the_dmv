require "./lib/registrant"

RSpec.describe Registrant do
    before do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    it 'exists' do
        expect(@registrant_1).to be_a Registrant
    end

    it 'has a name' do
        expect(@registrant_1.name).to eq 'Bruce'
        expect(@registrant_2.name).to eq 'Penny'
    end

    it 'has an age' do
        expect(@registrant_1.age).to eq 18
        expect(@registrant_2.age).to eq 15
    end

    it 'may or may not have a permit' do
        expect(@registrant_1.permit?).to be true
        expect(@registrant_2.permit?).to be false
    end

    it 'has license data' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can earn permit' do
        expect(@registrant_2.permit?).to be false
        @registrant_2.earn_permit
        expect(@registrant_2.permit?).to be true
    end

    it 'can pass written test' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.pass_written_test).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'can earn license after passing written test' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.earn_license).to be_nil
        @registrant_1.pass_written_test
        expect(@registrant_1.earn_license).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it 'can renew license after license is earned' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.renew_license).to be_nil
        @registrant_1.pass_written_test
        expect(@registrant_1.renew_license).to be_nil
        @registrant_1.earn_license
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        expect(@registrant_1.renew_license).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
end