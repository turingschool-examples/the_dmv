require 'spec_helper'

RSpec.describe Registrant do

    describe '#initialize' do
        it 'Exist' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_1).to be_a(Registrant)
            expect(registrant_2).to be_a(Registrant)
        end

        it 'Can hold a attribures: name, age, and permite. The latter defaults to false' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_1.name).to eq("Bruce")
            expect(registrant_2.name).to eq("Penny")  
            expect(registrant_1.age).to eq(18)
            expect(registrant_2.age).to eq(15)
            expect(registrant_1.permit?).to eq(true)
            expect(registrant_2.permit?).to eq(false)
        end

        it 'is initialized with a hash of license data' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)
            
            expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

    describe '#permit?' do
        it 'Checks return of @permit' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_1.permit?).to eq(true)
            expect(registrant_2.permit?).to eq(false)
        end
    end

    describe '#change_permit' do
        it "Can earn a permite changing @permit to true" do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)
            registrant_1.earn_permit
            expect(registrant_1.permit?).to eq(true)
            registrant_2.earn_permit
            expect(registrant_2.permit?).to eq(true)
        end
    end

    describe '#change_license_data' do
        it 'Can allow access to @license_data hash' do
            registrant_1 = Registrant.new('Bruce', 18, true)
            registrant_2 = Registrant.new('Penny', 15)

            expect(registrant_1.license_data).to eq({
                written: false,
                license: false,
                renewed: false
            })

            registrant_1.change_license_data(:written, true)
            expect(registrant_1.license_data).to eq({
                written: true,
                license: false,
                renewed: false
            })

            registrant_1.change_license_data(:license, true)
            expect(registrant_1.license_data).to eq({
                written: true,
                license: true,
                renewed: false
            })
        end
    end
end