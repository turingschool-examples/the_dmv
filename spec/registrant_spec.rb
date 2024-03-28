require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant = Registrant.new('John Doe', 21, true)
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant).to be_an_instance_of(Registrant)
            expect(@registrant.name).to eq('John Doe')
            expect(@registrant.age).to eq(21)
            expect(@registrant.permit).to eq(true)
        end
    end

    describe '#has_license?' do
        it 'can check if a registrant has a permit' do
            expect(@registrant.license_data[:license]).to eq(false)
        end
    end

    describe '#earn_permit' do
        it 'can earn a permit' do
            @registrant.earn_permit
            expect(@registrant.permit).to eq(true)
        end
    end

    describe 'license_data' do
        it 'can return license data' do
            expect(@registrant.license_data).to eq({written: false, license: false, renewed: false})
        end
    end

    describe 'has_permit?' do
        it 'can check if a registrant has a permit' do
            expect(@registrant.permit?).to eq(true)
        end
    end
end