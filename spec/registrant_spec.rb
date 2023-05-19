require './lib/registrant'

RSpec.describe Registrant do
    it 'is an instance of Registrant' do
        registrant = Registrant.new('Bruce', 18, true )
        expect(registrant).to be_a_instance_of(Registrant)
    end

    it 'returns the data for a Registrant' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_1.name).to eq("Bruce")
        expect(registrant_1.age).to eq(18)
        expect(registrant_1.permit?).to eq(true)
    end

end