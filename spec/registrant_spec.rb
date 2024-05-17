require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
        @registrant_2 = Registrant.new('Penny', 16)
    end

    describe '#initialize' do
     it 'makes a registrant with a permit' do
        expect(@registrant_1.name).to eq('Bruce')
        expect(@registrant_1.age).to eq(18)
        expect(@registrant_1.permit?).to eq(true)
        expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
     end

    it 'makes a registrant with no permit' do
        expect(@registrant_2.name).to eq('Penny')
        expect(@registrant_2.age).to eq(15)
        expect(@registrant_2.permit?).to eq(false)
        expect(@registrant_2.license_data).to eq(:written => false, :license => false, :renewed => false)
    end

    describe '#earn_permit' do
     it 'updates permit to true' do
        expect(registrant_2.permit?).to eq(false)
        do @registrant_2.earn_permit
        end
        expect(@registrant_2.permit?).to eq(true)
    end
end
