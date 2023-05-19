require './lib/registrant'
#permit of registrant_2 not following interaction pattern fully, shouldn't have to include. Maybe false by default? 
RSpec.describe Registrant do
  before(:each) do
      @registrant_1 = Registrant.new(name: 'Bruce', age: 18, permit: true )
      @registrant_2 = Registrant.new(name: 'Penny', age: 15, permit: false)
    end
    describe '#initialize' do
      it 'can initialize' do
        expect(@registrant_1).to be_an_instance_of(Registrant)
        expect(@registrant_2).to be_an_instance_of(Registrant)
        expect(@registrant_1.name).to eq('Bruce')
        expect(@registrant_2.name).to eq('Penny')
        expect(@registrant_1.age).to eq(18)
        expect(@registrant_2.age).to eq(15)
        expect(@registrant_1.permit).to eq(true)
        expect(@registrant_2.permit).to eq(false)
      end
  end
end