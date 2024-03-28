require "spec_helper"

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    it "is a class of Registrant" do
        expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it "checks if registrant has a name" do
        expect(@registrant_1.name).to eq('Bruce')
    end

    it "checks if registrant has an age" do
        expect(@registrant_1.age).to eq(18)
    end

    it "checks if registrant has a permit" do
        expect(@registrant_1.permit?).to eq(true)
    end

    it "checks registrant's license data" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    
    it "can check permit data default value" do
        expect(@registrant_2.permit?).to eq(false)
    end
    
    xit "" do
        expect().to eq()
    end
    
    xit "" do
        expect().to eq()
    end

    xit "" do
        expect().to eq()
    end
    
    xit "" do
        expect().to eq()
    end
end