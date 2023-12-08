require 'spechelper'

RSpec.describe Registrant do
    describe '#initialize' do
        it 'exists' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            
            expect(registrant_1).to be_a(Registrant)
        end

        it 'has a name' do
            registrant_1 = Registrant.new('Bruce', 18, true)

            expect(registrant_1.name).to eq('Bruce')
        end

        it 'can have a different name' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_2.name).to eq('Penny')
        end
    end

    describe '#permit?' do
        it 'has a default value of false for permit' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_2.permit?).to eq(false)
        end

        it 'can ask if it has a permit' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_1.permit?).to eq(true)
        end
    end

    describe '#license_data' do
        it 'starts with default values for license data' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_1.license_data).to eq({written: false, license: false, renewed: false})
            expect(registrant_2.license_data).to eq({written: false, license: false, renewed: false})
        end
    end

    describe '#earn_permit' do
        it 'can earn its permit' do
            registrant_2 = Registrant.new('Penny', 15)

            registrant_2.earn_permit

            expect(registrant_2.permit?).to eq(true)
        end

        it 'does not affect someone with a permit already' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            
            registrant_1.earn_permit

            expect(registrant_1.permit?).to eq(true)
        end
    end
end