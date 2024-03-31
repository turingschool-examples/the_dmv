require 'spec_helper'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
        @registrant_2 = Registrant.new('Penny', 16)
        @registrant_3 = Registrant.new('Tucker', 15 )
    end

    describe '#initialize' do
        it 'exists' do

        expect(@registrant_1).to be_an_instance_of(Registrant)
        end
    end

    describe '#earn_permit' do
        it 'allows a registrant to earn a permit' do
            @registrant_2.earn_permit
            expect(@registrant_2.permit).to eq(true)
        end
    end

    describe "#permit?" do
        it 'shows if someone has a permit' do
            expect(@registrant_1.permit?).to eq(true)
        end

        it 'shows if someone does not have a permit' do
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe '#license_data' do
        it 'shows registration details for a registrant' do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end
end