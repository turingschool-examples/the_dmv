require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
        @registrant_2 = Registrant.new('Penny', 15)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_2).to be_an_instance_of(Registrant)
        end

        it 'has a name' do
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_2.name).to eq('Penny')
        end

        it 'has an age' do
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_2.age).to eq(15)
        end

        it 'has correct license data' do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

    describe '#permit?' do
        it 'has no permit by default' do
            expect(@registrant_2.permit?).to be false
        end

        it 'has a permit if specified' do
            expect(@registrant_1.permit?).to be true
        end
    end

    describe '#earn_permit' do
        it 'can change default permit value to true' do
            expect(@registrant_2.permit?).to be false
            @registrant_2.earn_permit
            expect(@registrant_2.permit?).to be true
        end
    end

    describe '#pass_written_test' do
        it 'can change value of license_data[:written] to true' do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

            @registrant_1.pass_written_test

            expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        end
    end

    describe '#pass_road_test' do
        it 'can change value of license_data[:license] to true' do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

            @registrant_1.pass_road_test

            expect(@registrant_1.license_data).to eq({:written=>false, :license=>true, :renewed=>false})
        end
    end

    describe '#drivers_license_renewal' do
        it 'can change value of license_data[:renewed] to true' do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

            @registrant_1.drivers_license_renewal

            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>true})
        end
    end
end