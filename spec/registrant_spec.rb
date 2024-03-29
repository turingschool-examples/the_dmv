require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant = Registrant.new
        @registrant_1 = Registrant.new('Bruce', 18, true)
        @registrant_2 = Registrant.new('Penny', 15 )
    end


describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
      expect(@registrant.name).to eq(name)
      expect(@registrant.age).to eq(age)
      expect(@registrant.permit).to be false
      expect(@registrant.license_date).to eq({:written => false, :license => false, :renewed => false})
    end
  end

# describe 'earn permit' do
#     it 'can earn a permit' do
#         expect(@registrant).

#     end
# end
end