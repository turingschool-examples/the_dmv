require 'spec_helper'
RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
        @registrant_2 = Registrant.new('Penny', 16)
        @registrant_3 = Registrant.new('Tucker', 15)
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

    describe "#can initialize" do
        it "it can initialize" do
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.name).to eq("Bruce")
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

    describe "#can earn permit" do
        it "can has a permit value" do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)  
        end
        
        it "can earn permit" do
            expect(@registrant_2.earn_permit).to eq(true)
            expect(@registrant_2.permit?).to eq(true)
        end
    end
end
