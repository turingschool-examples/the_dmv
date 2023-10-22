require 'spec_helper'

# RSpec.describe Registrant do
#     it 'exists' do
#         registrant_1 = Registrant.new('Bruce', 18, true )

#         expect(registrant_1).to be_a(Registrant)
#     end

# end

RSpec.describe Registrant do
    it "exists" do
        registrant_1 = Registrant.new('Bruce', 18, true )

        expect(registrant_1).to be_a(Registrant)
    end

    it "exists R1 & R2" do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        
        expect(registrant_1).to be_an_instance_of(Registrant)
        expect(registrant_2).to be_an_instance_of(Registrant)
    end

    it "#name" do
        registrant_1 = Registrant.new('Bruce', 18, true )

        expect(registrant_1.name).to eq('Bruce')
    end

    it "#age" do
        registrant_1 = Registrant.new('Bruce', 18, true )

        expect(registrant_1.age).to eq(18)
    end

    it "#permit" do
        registrant_1 = Registrant.new('Bruce', 18, true )

        expect(registrant_1.permit).to eq(true)
    end

end








# RSpec.describe Registrant do
#     before(:each) do
#     @registrant_1 = Registrant.new('Bruce', 18, true )
#     @registrant_2 = Registrant.new('Penny', 15 )
#     end

# describe'initalize' do
#     it 'exits' do
#         expect(@registrant_1)
#     end
# end
