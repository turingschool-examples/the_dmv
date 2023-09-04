require './lib/registrant'


RSpec.describe Registrant do 
    before(:each) do 
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny',15)
    end 

    describe "initialize" do 
        it "checks if registrant" do
         expect(@registrant_1).to  be_an_instance_of(Registrant)
         expect(@registrant_2).to be_an_instance_of(Registrant)
    
        end 
    end 

    it "can store name" do 
        expect(@registrant_1.name).to eq('Bruce')
        expect(@registrant_2.name).to eq('Penny')
    end

    it 'stores age' do 
        expect(@registrant_1.age).to eq(18)
        expect(@registrant_2.age).to eq(15)
    end 

    it "checks licesne data" do 
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

    end 

    it "store permit value to default" do 
        expect(@registrant_1.permit?).to eq(true)
        expect(@registrant_2.permit?).to eq(false)
    end 

end 

 