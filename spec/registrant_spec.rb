require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new({name: "Bruce", age: 18, permit: true})
        @registrant_2 = Registrant.new({name: "Penny", age: 15, permit: false})
        @registrant_3 = Registrant.new({name: "Tucker", age: 15, permit: false})
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2).to be_an_instance_of(Registrant)
            expect(@registrant_2.name).to eq('Penny')
            expect(@registrant_2.age).to eq(15)
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe '#permit?' do
        it 'can check if registrant has a permit' do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe '#earn_permit' do
        it "can change permit status" do
            expect(@registrant_2.earn_permit).to eq(true)
        end
    end

    # describe '#take_written_test' do
    #     it 'change written test status' do
    #         expect
        
end