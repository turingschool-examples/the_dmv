require './lib/registrant'

RSpec.describe Registrant do
    it 'is an instance of Registrant' do
        registrant = Registrant.new
        expect(Registrant.new).to be_a_instance_of(Registrant)
    end

end