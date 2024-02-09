require 'spec_helper.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Registrant do

    it 'registrants can exist' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_1).to be_an_instance_of (Registrant)
        expect(registrant_2).to be_an_instance_of (Registrant)
    end

    it 'registrants have names' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_1.name).to eq ("Bruce")
        expect(registrant_2.name).to eq ("Penny")
    end

    it 'registrants have an age' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_1.age).to eq (18)
        expect(registrant_2.age).to eq (15)

end