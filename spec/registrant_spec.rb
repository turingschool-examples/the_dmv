require 'spec_helper'
require './lib/registrant'


RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
    end

    it 'exists' do
        expect(@registrant_1).to be_instance_of(Registrant)
    end
    describe 'attributes' do
        it 'has attributes' do
            expect(@registrant_1.name).to eq("Bruce")
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.permit).to eq(true)
            expect(@registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
        end
    end
    describe 'methods work' do
        it 'checks permit and earn permit' do
        registrant_2 = Registrant.new('Al',15)
        expect(registrant_2.permit?).to eq(false)
        registrant_2.earn_permit
        expect(registrant_2.permit?).to eq(!false)
        end
    end
end
