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
